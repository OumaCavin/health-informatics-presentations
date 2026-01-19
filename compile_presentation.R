# =============================================================================
# LaTeX Beamer Presentation Compilation Script for RStudio on Windows
# =============================================================================
# Repository: https://github.com/OumaCavin/health-informatics-presentations
# Presentation: combined_presentation.tex
# =============================================================================

# =============================================================================
# METHOD 1: Using tinytex R Package (RECOMMENDED)
# =============================================================================

# Step 1: Install required R packages (run once)
# -----------------------------------------------------------------------------

# Install tinytex package if not already installed
if (!require("tinytex", quietly = TRUE)) {
  install.packages("tinytex", repos = "https://cloud.r-project.org/")
}

# Install helper packages for file operations
if (!require("here", quietly = TRUE)) {
  install.packages("here", repos = "https://cloud.r-project.org/")
}

# Step 2: Install LaTeX distribution via tinytex (run once)
# -----------------------------------------------------------------------------

# Install TinyTeX - a lightweight LaTeX distribution for Windows
tinytex::install_tinytex()

# Note: This will download approximately 300-500 MB of LaTeX packages
# Installation time: 5-15 minutes depending on internet speed

# Step 3: Install additional LaTeX packages required for the presentation
# -----------------------------------------------------------------------------

# Install required LaTeX packages for the Beamer presentation
tinytex::tlmgr_install(c(
  # Core packages
  "beamer",
  "metropolis",
  "pgf",
  "xcolor",
  # Font packages
  "lm",
  "fontspec",
  # Graphics packages
  "graphics",
  "graphicx",
  # Table packages
  "booktabs",
  "array",
  # Mathematics packages
  "amsmath",
  "amssymb",
  # Utility packages
  "caption",
  "hyperref",
  # Required font packages for Windows
  "tex-gyre",
  "inconsolata",
  # Additional dependencies
  "everyshi",
  "calc",
  "xkeyval"
))

# Step 4: Compile the presentation
# -----------------------------------------------------------------------------

# Load libraries
library(tinytex)
library(here)

# Set the working directory to where the presentation is located
# Replace "health_informatics_presentations" with your actual path if different
setwd(here("health_informatics_presentations"))

# Define the presentation file
presentation_file <- "combined_presentation.tex"

# Check if file exists
if (!file.exists(presentation_file)) {
  stop("Error: ", presentation_file, " not found in the current directory!")
}

# Compile LaTeX to PDF
# The compile_latex() function handles multiple LaTeX passes automatically
message("Compiling: ", presentation_file)
message("This may take a few minutes...\n")

# Compile with verbose output for debugging
tinytex::latexmk(
  file = presentation_file,
  engine = "xelatex",
  clean = TRUE
)

# Check if PDF was created successfully
pdf_file <- gsub("\\.tex$", ".pdf", presentation_file)
if (file.exists(pdf_file)) {
  message("\n✓ SUCCESS! PDF generated: ", pdf_file)
  message("File size: ", round(file.info(pdf_file)$size / 1024, 1), " KB")
  
  # Open the PDF automatically
  shell.exec(pdf_file)
} else {
  stop("Error: PDF compilation failed!")
}

# =============================================================================
# METHOD 2: Using R Markdown (Alternative Approach)
# =============================================================================

# If you prefer using R Markdown, you can convert the Beamer presentation
# to an Rmd file or compile it directly from LaTeX

# Option A: Compile LaTeX directly in R Markdown
# Create a simple Rmd file that loads the LaTeX presentation

render_latex_rmd <- function(tex_file, output_file) {
  # Create Rmd content
  rmd_content <- c(
    '---',
    'title: "Health Informatics Presentations"',
    'author: "Cavin Otieno"',
    'date: "`r Sys.Date()`"',
    'output:',
    '  pdf_document:',
    '    template: null',
    '    pandoc_args: ["--from=latex", "--to=pdf"]',
    '---',
    paste('```{=latex}', readLines(tex_file, warn = FALSE), '```', sep = "\n")
  )
  
  # Write Rmd file
  rmd_file <- gsub("\\.tex$", ".Rmd", tex_file)
  writeLines(rmd_content, rmd_file)
  
  # Render
  rmarkdown::render(rmd_file, output_file = output_file)
}

# =============================================================================
# METHOD 3: Direct Shell Commands (PowerShell)
# =============================================================================

# Alternative: Use system commands to compile directly

compile_with_shell <- function(tex_file = "combined_presentation.tex") {
  
  # Get absolute path
  tex_path <- normalizePath(tex_file)
  tex_dir <- dirname(tex_path)
  tex_file <- basename(tex_path)
  
  # Change to presentation directory
  old_wd <- getwd()
  setwd(tex_dir)
  
  message("Compiling LaTeX presentation...")
  message("Working directory: ", tex_dir)
  message("File: ", tex_file, "\n")
  
  # Run xelatex compilation (3 passes for complete resolution)
  for (pass in 1:3) {
    message("Pass ", pass, " of 3...")
    
    # Compile with xelatex
    system2(
      command = "xelatex",
      args = c(
        "-interaction=nonstopmode",
        "-shell-escape",
        tex_file
      ),
      stdout = TRUE,
      stderr = TRUE
    )
  }
  
  # Clean up auxiliary files
  aux_files <- c(
    "\\.log$", "\\.aux$", "\\.nav$", "\\.out$",
    "\\.snm$", "\\.toc$", "\\.vrb$", "\\.xdv$"
  )
  
  for (pattern in aux_files) {
    aux_files_list <- list.files(
      path = tex_dir,
      pattern = pattern,
      full.names = TRUE
    )
    if (length(aux_files_list) > 0) {
      file.remove(aux_files_list)
    }
  }
  
  # Check for PDF
  pdf_file <- gsub("\\.tex$", ".pdf", tex_file)
  if (file.exists(pdf_file)) {
    message("\n✓ PDF generated successfully!")
    message("File: ", file.path(tex_dir, pdf_file))
    
    # Open PDF
    shell.exec(file.path(tex_dir, pdf_file))
  } else {
    message("\n✗ PDF generation failed. Check the .log file for errors.")
  }
  
  # Restore working directory
  setwd(old_wd)
}

# To use: uncomment and run the line below
# compile_with_shell("combined_presentation.tex")

# =============================================================================
# TROUBLESHOOTING AND COMMON ISSUES
# =============================================================================

troubleshoot_compilation <- function(tex_file = "combined_presentation.tex") {
  
  message("=== TROUBLESHOOTING GUIDE ===\n")
  
  # Check 1: LaTeX installation
  message("1. Checking LaTeX installation...")
  latex_path <- Sys.which("xelatex")
  if (latex_path == "") {
    message("   ✗ XeLaTeX not found!")
    message("   → Solution: Run tinytex::install_tinytex() or install MiKTeX")
  } else {
    message("   ✓ XeLaTeX found at: ", latex_path)
  }
  
  # Check 2: Required LaTeX packages
  message("\n2. Checking required LaTeX packages...")
  message("   → Install missing packages using:")
  message('   tinytex::tlmgr_install(c("package1", "package2"))')
  
  # Check 3: File existence
  message("\n3. Checking presentation file...")
  if (!file.exists(tex_file)) {
    message("   ✗ File not found: ", tex_file)
    message("   → Solution: Ensure the file exists in the working directory")
  } else {
    message("   ✓ File exists: ", tex_file)
  }
  
  # Check 4: Working directory
  message("\n4. Working directory: ", getwd())
  message("   → Ensure your .tex file is in this directory")
  
  # Check 5: Common error solutions
  message("\n5. Common Solutions:")
  message("   - 'File not found' errors: Install missing LaTeX packages")
  message("   - Font errors: Install tex-gyre and inconsolata packages")
  message("   - Beamer errors: Install metropolis theme package")
  message("   - TikZ errors: Install pgf package")
  
  message("\n6. For detailed error messages:")
  message("   → Check the .log file generated during compilation")
  message("   → Open log: shell.exec(gsub('.tex', '.log', tex_file))")
}

# To run troubleshooting:
# troubleshoot_compilation("combined_presentation.tex")

# =============================================================================
# COMPLETE ONE-CLICK COMPILATION FUNCTION
# =============================================================================

compile_presentation <- function(
  tex_file = "combined_presentation.tex",
  open_pdf = TRUE,
  clean_aux = TRUE
) {
  
  message("================================================")
  message("  LaTeX Beamer Presentation Compiler")
  message("================================================\n")
  
  # Record start time
  start_time <- Sys.time()
  
  # Load libraries
  if (!require("tinytex", quietly = TRUE)) {
    stop("Please install tinytex first: install.packages('tinytex')")
  }
  
  # Ensure tinytex is properly installed
  if (nzchar(Sys.which("xelatex")) == FALSE) {
    message("Installing TinyTeX...")
    tinytex::install_tinytex()
  }
  
  # Check file exists
  if (!file.exists(tex_file)) {
    stop("Error: File '", tex_file, "' not found!\n",
         "Current directory: ", getwd())
  }
  
  message("Compiling: ", tex_file, "\n")
  
  # Install required packages if needed
  required_pkgs <- c(
    "beamer", "metropolis", "pgf", "xcolor",
    "lm", "fontspec", "booktabs", "caption"
  )
  
  missing_pkgs <- required_pkgs[!required_pkgs %in% tinytex::tlmgr_pkgs()$name]
  if (length(missing_pkgs) > 0) {
    message("Installing missing LaTeX packages...\n")
    tryCatch({
      tinytex::tlmgr_install(missing_pkgs)
    }, error = function(e) {
      message("Warning: Some packages may need manual installation")
      message("Error: ", e$message, "\n")
    })
  }
  
  # Compile
  message("Running XeLaTeX compilation...\n")
  
  result <- tinytex::latexmk(
    file = tex_file,
    engine = "xelatex",
    clean = clean_aux
  )
  
  # Check output
  pdf_file <- gsub("\\.tex$", ".pdf", tex_file)
  
  if (file.exists(pdf_file)) {
    elapsed <- round(difftime(Sys.time(), start_time, units = "secs"), 1)
    
    message("\n================================================")
    message("  COMPILATION SUCCESSFUL!")
    message("================================================")
    message("Output: ", pdf_file)
    message("Size: ", round(file.info(pdf_file)$size / 1024, 1), " KB")
    message("Time: ", elapsed, " seconds")
    message("================================================\n")
    
    if (open_pdf) {
      message("Opening PDF...")
      shell.exec(pdf_file)
    }
    
    return(invisible(TRUE))
    
  } else {
    stop("Compilation failed! Check the .log file for errors.\n")
  }
}

# =============================================================================
# USAGE INSTRUCTIONS
# =============================================================================

message("\n")
message("╔════════════════════════════════════════════════════════════════════╗")
message("║           LATEX BEAMER PRESENTATION - COMPILATION GUIDE            ║")
message("╠════════════════════════════════════════════════════════════════════╣")
message("║                                                                    ║")
message("║  QUICK START:                                                      ║")
message("║                                                                    ║")
message("║  1. Open RStudio                                                   ║")
message("║  2. Load this script or copy the functions                        ║")
message("║  3. Set working directory to presentation folder                  ║")
message("║  4. Run: compile_presentation('combined_presentation.tex')         ║")
message("║                                                                    ║")
message("║  FIRST TIME SETUP (run once):                                      ║")
message("║                                                                    ║")
message("║  install.packages('tinytex')                                       ║")
message("║  tinytex::install_tinytex()                                        ║")
message("║  # Restart R after installation                                    ║")
message("║                                                                    ║")
message("║  For troubleshooting, run:                                         ║")
message("║  troubleshoot_compilation('combined_presentation.tex')             ║")
message("║                                                                    ║")
message("╚════════════════════════════════════════════════════════════════════╝\n")
