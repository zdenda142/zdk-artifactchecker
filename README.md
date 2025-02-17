# Artifact Checker

  This script checks the current version of the FXServer artifact and compares it with the latest available version.
  If the current version is outdated, it will show a warning and recommend updating to the latest stable version.

  Steps:
  1. The script retrieves the current server version from the `version` convar.
  2. It sends an HTTP request to the changelog API to get the latest artifact version.
  3. If the versions don't match, it prints a warning with the current and latest version.
  4. If the versions match, it prints a confirmation that the server is up-to-date.

  How to use:
  - Add this script to your FXServer.
  - It will automatically check the version when the server starts.
