# Getting ready for Session 1
R Shiny Community of Practice at DDOE

Session 1 uses the FAFSA app to practice project organization and version control. Complete these checks before the meeting and bring any setup questions. The live exercise uses a private practice GitHub repository.

## Computer and accounts
- Open RStudio and confirm that R starts.
- Open RStudio's Terminal and run `git --version`. A version number confirms that this Terminal can find Git. If Git is missing, use the installation route approved for your computer.
- Sign in to the GitHub account you will use. Create an empty private practice repository in that account. Leave its README, license and gitignore options unselected.
- Check RStudio's Git settings under Tools > Global Options > Git/SVN. The Git executable should appear. Menu names may vary slightly by version.

## Practice files
- Download the FAFSA starter ZIP from the [session page](../README.md#practice-app). Extract it outside the course repository and any other Git repository. Work in the extracted files.
- Open `fafsa_template/fafsa_template.Rproj`.
- In the R Console, run the two checks below. Both should return `TRUE`.
```r
file.exists("fafsa_template.Rproj")
file.exists(file.path("input_data", "fafsa_completion.csv"))
```
- Install missing packages in the R Console. Allow time for installation to finish.
```r
install.packages(c("shiny", "bslib", "tidyverse", "scales"))
```
- Run `shiny::runApp()` in the R Console. Confirm that the app opens and shows school year 2026. Stop the app before continuing with setup commands.

## GitHub access check
In the Terminal, use your actual HTTPS practice URL:
```text
git ls-remote "YOUR_PRACTICE_REPOSITORY_HTTPS_URL"
```
Complete authentication if prompted. An empty repository can return no text and no error. Bring any access error to Matt before the meeting. This checks read access, rather than confirming a later push.

## What to bring
Bring the extracted app, your private practice repository URL, and one question about your own R workflow. During the meeting, keep the app and [companion](../companion.md) open.

Record the GitLab access route Matt confirms for the next meeting.

## Help from ChatGPT
Give ChatGPT [ChatGPT context](../prompts/CHATGPT_CONTEXT.md), your operating system and Terminal type, the step you are on, and the command plus relevant output. Ask it to explain the next diagnostic step. Use the training files and omit credentials or confidential records.
