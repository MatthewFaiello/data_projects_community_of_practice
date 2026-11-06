# FAFSA Session 1 practice project

This is the supplied FAFSA training app prepared for the DDOE R Shiny community of practice. Open `fafsa_template.Rproj` to work from the app folder. The [session page](../README.md) links the companion, procedures and ChatGPT context.

## Run locally
Install the R packages `shiny`, `bslib`, `tidyverse` and `scales` through your approved package route. Restart R, then run:

```r
shiny::runApp()
```

The training copy opens at school year 2026. Its supplied CSV is a fixed snapshot with years 2015 through 2027. Year 2027 has no receipt months and displays the intentional no-data message. This is a training snapshot, not a current report.

## File responsibilities
| File or folder | Purpose |
| --- | --- |
| global.R | Shared packages, input, labels and defaults |
| ui.R | Browser interface |
| server.R | Reactive connections and rendered outputs |
| R/analysis.R | Filtering and analytical calculations |
| R/plot.R | Plot and chart text functions |
| input_data/fafsa_completion.csv | Supplied summarized app input |
| www/ | CSS and supplied header image |
| prep/ | Upstream SQL and external QA reference |
| documentation/ | Original guide and training change notes |

The app loads the CSV directly. The Session 1 exercise does not require running upstream SQL. Matt's directory layout is an example that can be adapted to other work.

## Git starting point
This practice copy has no inherited Git repository or remote. Initialize it only after confirming the folder and reviewing the supplied `.gitignore`. The app-only practice repository includes the app input and excludes `prep/`, `documentation/`, local state, credentials and deployment records. Maintain preparation code in an appropriate version-controlled location outside an app-only repository.

## Exercises
1. Record the initial app version in your own private practice repository.
2. Change `APP_TITLE` in `global.R` to `FAFSA Completion - Practice`.
3. Save and test, inspect the difference, commit and push.
4. For take-home practice, make a small explanatory wording change in `ui.R`.

The starter ZIP includes the original app explanation in `documentation/Original_FAFSA_App_Readme.md` and training adjustments in `documentation/TRAINING_CHANGES.md`.
