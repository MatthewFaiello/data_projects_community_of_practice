# Run in the R Console from the FAFSA app project.
# These commands inspect the setup. They do not install packages.
getwd()
file.exists("fafsa_template.Rproj")
file.exists(file.path("input_data", "fafsa_completion.csv"))
required <- c("shiny", "bslib", "tidyverse", "scales")
required %in% rownames(installed.packages())

# After the checks pass, launch separately:
# shiny::runApp()
