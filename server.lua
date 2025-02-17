local function checkArtifactVersion()
    local versionConvar = GetConvar("version", "unknown")
    local fxServerVersion = string.match(versionConvar, "v%d+%.%d+%.%d+%.(%d+)") or "unknown"

    PerformHttpRequest("https://changelogs-live.fivem.net/api/changelog/versions/win32/server", function(code, data, _, errorData)
      if code ~= 200 or errorData then
        print("^1[ERROR] Could not check artifact version. HTTP Code: " .. tostring(code) .. "^0")
        return
      end

      if not data then
        print("^1[ERROR] No data received from the artifact check endpoint.^0")
        return
      end

      local success, json = pcall(json.decode, data)
      if not success or not json then
        print("^1[ERROR] Failed to decode JSON response.^0")
        return
      end

      local latestVersion = json[1] and json[1].version or "unknown"

      if fxServerVersion ~= latestVersion then
        print(string.format("^1WARNING: The current FXServer artifact version (%s) is outdated. Latest version is %s.^0", fxServerVersion, latestVersion))
        print("^1Please update to the latest stable artifacts: https://runtime.fivem.net/artifacts/fivem/^0")
      else
        print("^2Artifacts are up to date and stable.^0")
      end
    end)
end

CreateThread(checkArtifactVersion)