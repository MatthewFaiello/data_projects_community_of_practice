# Git and GitHub procedures

Detailed reference for the [Session 1 companion](../companion.md). Work in the extracted app folder outside the course repository.

# Procedure 1 RStudio Project setup

## Purpose and starting point
Provide a predictable starting folder for R work. For the supplied app, open its existing `.Rproj`. For another project, create a Project in the intended new or existing directory using RStudio's New Project options.

## Steps
1. Place the work in its intended project folder. For the training, extract the starter ZIP and use the extracted `fafsa_template` folder outside the course repository.
2. Open the existing `.Rproj`, or create a Project in the intended directory. Keep the project root and repository scope clear.
3. Document required inputs, packages and the run command in the README.
4. Prefer paths that start at the project root, such as the FAFSA example below.

R Console:
```r
getwd()
file.exists("fafsa_template.Rproj")
file.exists(file.path("input_data", "fafsa_completion.csv"))
```
Expected result: the working directory is the app folder and both file checks are `TRUE`.

## Session and package choices
The training `.Rproj` turns off workspace restoration and saving. Restart R before testing so the app must load what its code needs. The `.Rproj` does not lock package versions or install dependencies. Record the packages in the README. Package-environment management can be a later CoP topic.

R Console, after dependencies are installed:
```r
shiny::runApp()
```
Expected result: the supplied app opens at 2026 and displays a chart. Year 2027 has no receipt months in this fixed snapshot and displays the intentional no-data message.

## Verification and recovery
If a file check fails, reopen the app's `.Rproj` and check the extracted directory. Confirm that all files were extracted together. Use the printed error and the README's dependency list to diagnose a failed launch. Avoid relying on objects left in an earlier R session.

Source: Posit RStudio Projects and Shiny app formats, linked in [Sources](sources.md).

# Procedure 2 Local Git setup

## Purpose and starting point
Start Git for the clean training app. This procedure assumes the app runs locally and the folder is outside another Git repository. If the folder already has history, inspect it and adapt the next step with the facilitator.

## Inspect in the Terminal
PowerShell uses `Get-Location`. macOS, Linux and Git Bash use `pwd`. Confirm the app folder, then run:
```text
git --version
git status
git rev-parse --show-toplevel
```
For the supplied clean starter, the last two commands report that it is not a Git repository. If they return a repository root, inspect that root before continuing.

## Initialize and identify commits
```text
git init
git branch -M main
git config user.name "YOUR NAME"
git config user.email "YOUR COMMIT EMAIL"
git status
```
Fill in the name and commit email before running the configuration commands. They apply to this repository. Authentication to GitHub is a separate requirement.

## Review and stage the intended files
Review the supplied `.gitignore`. Keep the required `input_data` CSV included. Then run:
```text
git add .gitignore README.md fafsa_template.Rproj
git add global.R ui.R server.R R/ input_data/ www/
git diff --cached --stat
git status
```
Inspect the staged file list. The app code, summarized CSV and assets should appear. Excluded preparation and local files should be absent.

If you staged a file accidentally before the first commit, ask the facilitator to inspect the index. There is no earlier commit to restore yet. Preserve the working files while correcting the staged selection.

# Procedure 2 GitHub connection

## Record the starting version
Terminal:
```text
git commit -m "Add FAFSA training app"
git log -1 --oneline
```
Expected result: the initial commit and its identifier appear.

## Create and connect the private repository
Open the empty private practice repository created before the meeting, or create it in the intended GitHub account if needed. Leave the README, license and gitignore initialization options unselected. Copy the HTTPS repository URL.

Replace the example account and repository before running:
```text
git remote add origin "https://github.com/YOUR_ACCOUNT/YOUR_REPO.git"
git remote -v
```
Confirm that both listed `origin` URLs identify the intended practice repository.
```text
git push -u origin main
```
Complete the authentication flow for your account. Refresh the GitHub page. Verify branch `main`, the expected app files and the initial commit.

## Existing state
If `origin` already exists, use `git remote -v` to identify it before making a change. If a repository already contains work, inspect its history and reconcile that starting point. A rejected push requires diagnosis. Preserve the existing remote history while deciding the next step.

## RStudio integration
Reopen the `.Rproj` after Git initialization if the Git pane is missing. Check the Git executable and version-control options in RStudio. The pane offers Diff, staging, Commit, History, Pull and Push. It acts on the Git repository and remotes configured for this project.

## Verification
Run `git rev-parse HEAD` locally and compare its beginning with the latest GitHub commit identifier. A successful local commit alone does not demonstrate that GitHub received it.

Source: GitHub Adding locally hosted code and Posit Version Control, linked in [Sources](sources.md).

# Procedure 3 Routine project updates

## Purpose and starting point
Record a tested change in the existing practice repository. Confirm the intended project and remote. For a shared project, check whether collaborators have pushed new work before beginning. Fetching remote information does not itself merge changes into your working files.

## Steps
1. Make a focused edit. Save the file.
2. Restart R and test the app. Stop it when finished.
3. Inspect the changed files and their differences.
4. Stage the intended files and review the staged diff.
5. Commit with a message that describes the change.
6. Push, then verify the commit on GitHub.

Terminal, for the title exercise:
```text
git status
git remote -v
git diff -- global.R
git add global.R
git diff --cached -- global.R
git commit -m "Label FAFSA app as practice"
git push
git status
git rev-parse HEAD
```
Before staging, `git diff` shows tracked edits that remain unstaged. After staging, `git diff --cached` shows what the next commit will contain. Re-stage a file if you edit it again after staging and want that additional edit in the commit.

## Verification
Confirm the intended result in the running app. Confirm the diff contains that change. Compare the local and GitHub commit identifiers. A clean working tree describes the local files; checking the remote confirms the shared version.

## If the push fails
Read the exact error. Inspect the remote and branch. If the remote advanced, fetch and review the relationship between histories before integrating changes. Discuss the next step with a collaborator or facilitator. Keep force-pushing outside this beginner update procedure.
