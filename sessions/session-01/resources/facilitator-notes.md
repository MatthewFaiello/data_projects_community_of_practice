# Session 1 facilitator guide
R Shiny community of practice at DDOE

Lead a conversation around the FAFSA app and use one small change to connect the ideas. The participant outcome is a locally running project, a clear account of its file structure, and a verified commit in a private practice GitHub repository.

## Loose ninety minute agenda
| Minutes | Focus | Observable checkpoint |
| --- | --- | --- |
| 0 to 10 | FAFSA demonstration and a DDOE handoff scenario | Folx identify what a colleague needs to refresh the app |
| 10 to 25 | Open the project and tour its files | Launch the app and explain its input path |
| 25 to 35 | Git and hosting roles | Explain saving, staging, committing and pushing |
| 35 to 80 | GitHub connection and one small change | Find the same commit locally and on GitHub |
| 80 to 90 | GitLab preview and next practice | Record access route and take-home task |

## Before the meeting
Send the companion preparation section and course materials beforehand. Ask folx to create their empty private practice repository and complete the Terminal access check before the meeting. In the live session, direct them to the app and companion. Introduce the other resources at the point of use.

Rehearse the exact participant sequence in RStudio from a fresh extraction. Check package installation, 2026 chart display, title edit and relaunch. Verify Git and account authentication on the demonstration machine. Have a private empty practice GitHub repository available.

Complete the companion access section's organizational fields using the current route, account instructions, network path, project creator and required permissions. Confirm the deployment process with the relevant owner before presenting it as a current requirement.

Keep a second clean extraction for reference and preserve screenshots of your successful demonstration in case account or network setup interrupts the live exercise. Check that the practice folder is outside another Git repository.

## Facilitation tone
Use "Here is how I organize this app and why" for directory choices. Invite alternatives. Explain the intended benefit of a convention before discussing whether the community should adopt it. Let folx ask what a command means before running it.

# Demonstration sequence

## Opening discussion
Show the FAFSA app in the first few minutes and change a filter. Then pose one situation: a colleague needs to refresh the app while you are away. Ask what they would need to locate, run and verify. Return to their answers when introducing the input path, README, Git history and handoff.

The opening slide uses the supplied app guide screenshot as a backup. That image shows year 2023. The live practice copy opens at 2026. Label the image as a reference and use the live app for the exercise.

Invite one or two related examples from folx. A funding calculation review can illustrate why versioned code and run order matter, while FAFSA remains the hands-on example.

## Project tour
By minute 10, have participants open the practice `.Rproj`. Show `getwd()` and the two file checks. Locate the CSV path in `global.R`. Briefly identify `ui.R`, `server.R`, and the two `R/` helpers. Run the app at 2026 and show one filter change.

## Git setup and GitHub
Begin the exercise around minute 35 and allow 45 minutes. Use the first part for initialization and the starting push, then follow the title edit through its second commit. Use the final few minutes to compare results and address questions.

Inspect the Terminal location and Git state. Explain the expected no-repository result in the clean starter. Initialize Git, set local commit identity, and inspect file exclusions. Stage the named app paths, review the staged summary and make the initial commit.

Create or open the empty private practice GitHub repository. Inspect the copied URL before adding the remote. Show `git remote -v`, then the first push and the commit online. Reopen the Project if needed for the Git pane.

## Visual references
The RStudio Git-pane image comes from Posit documentation and shows a different example project. Use it to locate Diff, staging and Commit, then point to the same controls in the live FAFSA project. The title diff is actual output from a local practice copy, reproduced as editable text. Its full copyable output is in `resources/commands/Title_Change_Diff.txt`.

## Visible change
Change `APP_TITLE` to `FAFSA Completion - Practice`. Save, restart and launch. Ask where the edit exists before a commit. Inspect the diff, stage `global.R`, review the staged diff, commit and push. Compare the local identifier with GitHub.

## Checkpoints to narrate
- The app path works because the project root is the starting folder.
- The staged selection determines what enters the commit.
- The remote identifies where the push goes.
- The online commit confirms what reached GitHub.

# Setup problems and fallback plans

## Missing Git or blocked installation
Keep the participant with a partner for the live demonstration. Record the installation issue and approved support route. They can still complete the directory and project checks. Arrange the Git exercise when their computer is ready.

## Authentication or network trouble
Preserve local work and capture the specific error. A local commit is a useful checkpoint while authentication is resolved. Use the prepared local diff to explain the change while access is resolved. Show the online result from your own prepared practice repository when available. Identify whose repository and completed push the group is viewing.

## Unexpected repository or remote
Use `git rev-parse --show-toplevel` and `git remote -v`. Confirm the folder and destination before making changes. If the clean starter sits inside a parent repository, move a fresh extracted practice copy to an appropriate folder outside it. Preserve the original project and history.

## App launch trouble
Check the project root and required input first, then the package list and complete error. Restart R before repeating the launch. Year 2027's no-data state is expected for this snapshot. The training copy opens at 2026.

## RStudio Git pane trouble
Reopen the Project and check Git settings. Continue the same conceptual workflow using the Terminal if the pane remains unavailable. The source of the GitHub connection is the repository's remote configuration.

## GitLab preview
Show the handoff sequence and the companion access section. Explain who develops the app, who receives the repository and who deploys it. Keep the distinction between a repository transfer and a server deployment visible. Use a practice destination for the later transfer exercise.

## Expected title checkpoint
The title exercise changes one line in `global.R`. The latest message is `Label FAFSA app as practice`. Each participant's commit hash will differ. The local and online hashes for their own repository should match.

# ChatGPT facilitation and follow up

## Build one prompt with the group
Open P2 in the repository prompt reference. Ask folx what information changes the next command: operating system, shell, folder, existing history and remote. Add the actual diagnostic results. Read the response and identify any assumptions before running a proposed step.

Ask a participant to explain what the command will affect. Run it, compare the result with the expected result, and decide what additional context the next prompt needs. Use P4 when a command needs unpacking and P3 when an error appears.

## Questions worth revisiting
What should another analyst know before running this project? Which inputs belong in the app repository? Where will preparation code be maintained? How will the group document exceptions? What small habit would make next month's refresh easier?

## Take home task
Ask folx to change the explanatory sentence in `ui.R`, test it and push one descriptive commit. They can bring that commit or a question. Collect GitLab access status before the transfer meeting and identify any support needed.

## Follow up message draft
Hi folx!

Thanks for joining today! The session page has the companion, linked procedures and ChatGPT prompts, along with the FAFSA practice app.

Before the next meeting, try one more small wording change in `ui.R`. Test it, review the difference, commit and push. Bring the commit or whatever question comes up along the way.

Please also use the GitLab access route we discussed and let me know where things stand. That will help me plan the next session around transferring the app and preparing the deployment handoff.

Thanks!

Matt

## Maintenance
Keep the Word and Markdown versions aligned when editing. Update the slide text companion when changing a slide or its notes. Record substantive changes in `CHANGELOG.md` and update shared command examples together.


## Course repository and practice folders
Send the [session page](../README.md) before the meeting. Participants download the starter ZIP and extract it outside the course repository and any other Git repository. The starter becomes a separate private practice repository. The two main participant files are slides.pptx and companion.docx. All other materials are links from the session page.
