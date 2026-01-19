# =============================================================================
# Compilation Script for Combined Quantitative Presentations
# =============================================================================
# This R script compiles the combined quantitative presentations LaTeX file
# to PDF format using the tinytex package in RStudio.
# 
# Prerequisites:
# 1. Install R (https://www.r-project.org/)
# 2. Install RStudio (https://www.rstudio.com/)
# 3. Install MiKTeX or TeX Live for Windows
#
# Usage in RStudio:
# 1. Open this script in RStudio
# 2. Select all code (Ctrl+A or Cmd+A)
# 3. Run selected code (Ctrl+Enter or Cmd+Enter)
# =============================================================================

# Method 1: Using tinytex package (RECOMMENDED for RStudio)
# This is the easiest method for RStudio users

# Step 1: Install tinytex package (run once)
# install.packages("tinytex")

# Step 2: Install TinyTeX distribution (run once)
# tinytex::install_tinytex()

# Step 3: Install required LaTeX packages (run once)
# tinytex::tlmgr_install(c(
#   "beamer",
#   "metropolis",
#   "pgf",
#   "xcolor",
#   "booktabs",
#   "graphics",
#   "tikz",
#   "amsmath",
#   "amssymb",
#   "fontspec",
#   "caption",
#   "setspace",
#   "geometry",
#   "hyperref",
#   "url",
#   "enumitem",
#   "relsize",
#   "iftex",
#   "ifplatform",
#   "svn-prov"
# ))

# Step 4: Compile the presentation
# Set working directory to where the .tex file is located
setwd("/workspace/health_informatics_presentations/")

# Compile using tinytex
tinytex::xelatex("combined_quantitative_presentations.tex")

# Alternative: Compile multiple times for cross-references
# tinytex::xelatex("combined_quantitative_presentations.tex")
# tinytex::xelatex("combined_quantitative_presentations.tex")

# Print success message
cat("\n")
cat("============================================================\n")
cat("  Compilation Complete!\n")
cat("============================================================\n")
cat("  Output file: combined_quantitative_presentations.pdf\n")
cat("  Location: /workspace/health_informatics_presentations/\n")
cat("============================================================\n\n")


# =============================================================================
# Method 2: Alternative compilation using render function
# =============================================================================

# If you prefer to use the rmarkdown::render approach:

# # Step 1: Create a temporary Rmd file that includes the LaTeX
# # This is useful if you want to add additional content
# 
# cat("---\n", file = "temp_render.Rmd")
# cat("title: 'Combined Quantitative Presentations'\n", file = "temp_render.Rmd", append = TRUE)
# cat("output: beamer_presentation\n", file = "temp_render.Rmd", append = TRUE)
# cat("---\n\n", file = "temp_render.Rmd", append = TRUE)
# 
# # Step 2: Render to PDF
# rmarkdown::render("temp_render.Rmd", output_format = "pdf_document")
# 
# # Clean up
# file.remove("temp_render.Rmd")


# =============================================================================
# Method 3: Command-line compilation (for advanced users)
# =============================================================================

# If you prefer to use command-line compilation:
# 
# # Windows (using MiKTeX):
# # Open Command Prompt and run:
# cd C:\path\to\health_informatics_presentations
# xelatex combined_quantitative_presentations.tex
# xelatex combined_quantitative_presentations.tex
# 
# # Linux/macOS:
# cd /path/to/health_informatics_presentations
# xelatex combined_quantitative_presentations.tex
# xelatex combined_quantitative_presentations.tex


# =============================================================================
# Troubleshooting Tips
# =============================================================================

# If compilation fails, try these steps:

# 1. Update tinytex:
# tinytex::reinstall_tinytex()

# 2. Check for missing packages:
# tinytex::tlmgr_search packages("package_name")

# 3. Install missing packages:
# tinytex::tlmgr_install("package_name")

# 4. Check LaTeX log for specific errors:
# file.show("combined_quantitative_presentations.log")

# 5. Verify file paths:
# getwd()
# list.files(pattern = "*.tex")


# =============================================================================
# System Requirements
# =============================================================================

# Minimum Requirements:
# - R version 4.0.0 or higher
# - tinytex package
# - 2GB RAM
# - 500MB disk space for LaTeX distribution

# Recommended:
# - R version 4.1.0 or higher
# - 4GB RAM
# - 1GB disk space
# - LaTeX distribution (TinyTeX recommended for RStudio)

# Operating System Support:
# - Windows 10/11
# - macOS 10.14+
# - Linux (Ubuntu 18.04+, Fedora 30+)


# =============================================================================
# File Information
# =============================================================================

cat("============================================================\n")
cat("  File Information\n")
cat("============================================================\n")
cat("  Input File:  combined_quantitative_presentations.tex\n")
cat("  Output File: combined_quantitative_presentations.pdf\n")
cat("  Topics Covered:\n")
cat("    - Q1: Maximum Likelihood Estimation and Logistic Regression\n")
cat("    - Q2: Cox Proportional Hazards Model and Hazard Ratios\n")
cat("    - Q3: Principal Component Analysis for Dimensionality Reduction\n")
cat("    - Q4: Machine Learning Workflow in Hospital Settings\n")
cat("============================================================\n\n")


# =============================================================================
# End of Compilation Script
# =============================================================================
