# Remove generated files from Git history

The paths below are tracked generated files, caches, or machine-specific settings. This rewrites repository history; coordinate with collaborators first. Everyone with an existing clone will need to re-clone or carefully reset it to the rewritten branches. The commands below target the `BE-Code/Gratitude-Journal` GitHub remote.

First commit and push the `.gitignore` update and this file from the normal working copy. Then run these commands in PowerShell **from the repository root**. They create a mirror clone and a recovery bundle next to the working copy, so the existing checkout and its uncommitted files are not rewritten. The mirror includes branches and tags currently published to GitHub; push any local-only branches you want preserved before continuing.

```powershell
$repoRoot = (git rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0) { throw "Run this from inside the repository." }
$parent = Split-Path -Parent $repoRoot
$mirrorPath = Join-Path $parent "Gratitude-Journal-history-clean.git"
$backupPath = Join-Path $parent "Gratitude-Journal-before-history-cleanup.bundle"
if (Test-Path $mirrorPath) { throw "Mirror path already exists: $mirrorPath" }
if (Test-Path $backupPath) { throw "Backup path already exists: $backupPath" }

git clone --mirror https://github.com/BE-Code/Gratitude-Journal.git $mirrorPath
if ($LASTEXITCODE -ne 0) { throw "Mirror clone failed." }
Set-Location $mirrorPath
git bundle create $backupPath --all
if ($LASTEXITCODE -ne 0) { throw "Backup bundle creation failed." }

git filter-repo --force --invert-paths `
  --path build/ `
  --path .dart_tool/ `
  --path .idea/ `
  --path .packages `
  --path .flutter-plugins `
  --path .flutter-plugins-dependencies `
  --path android/.gradle/ `
  --path android/local.properties `
  --path ios/Flutter/Generated.xcconfig `
  --path ios/Flutter/flutter_export_environment.sh `
  --path ios/Flutter/ephemeral/ `
  --path ios/Pods/ `
  --path ios/.symlinks/
if ($LASTEXITCODE -ne 0) { throw "History rewrite failed; do not push." }

git remote add origin https://github.com/BE-Code/Gratitude-Journal.git
if ($LASTEXITCODE -ne 0) { throw "Could not restore the push remote." }
git push --force --all origin
if ($LASTEXITCODE -ne 0) { throw "Branch push failed." }
git push --force --tags origin
if ($LASTEXITCODE -ne 0) { throw "Tag push failed." }
```

Install `git-filter-repo` before running the rewrite if it is not already available. Verify the cleaned branches on GitHub before asking collaborators to use the rewritten history. The bundle preserves a local backup of the original refs; keep it private and secure until it is no longer needed.

The ignore rules alone do not untrack files that already exist in commits. The history rewrite above removes those paths from every commit and branch included in the mirror clone.
