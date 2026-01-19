@echo off
REM =============================================================================
REM LaTeX Beamer Presentation Compilation Batch Script for Windows
REM =============================================================================
REM Repository: https://github.com/OumaCavin/health-informatics-presentations
REM Presentation: combined_presentation.tex
REM =============================================================================

echo.
echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║           LaTeX Beamer Presentation - PDF Compilation                 ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.

REM Check if xelatex is available
where xelatex >nul 2>&1
if errorlevel 1 (
    echo [ERROR] XeLaTeX not found!
    echo.
    echo Please install a LaTeX distribution:
    echo   Option 1: TinyTeX (via R)
    echo     install.packages("tinytex")
    echo     tinytex::install_tinytex()
    echo.
    echo   Option 2: MiKTeX (standalone)
    echo     Download from: https://miktex.org/download
    echo.
    echo   Option 3: TeX Live
    echo     Download from: https://www.tug.org/texlive/windows.html
    echo.
    pause
    exit /b 1
)

echo [INFO] XeLaTeX found. Proceeding with compilation...
echo.

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0
set PRESENTATION_DIR=%SCRIPT_DIR%

REM Change to the presentation directory
cd /d "%PRESENTATION_DIR%"

REM Check if the presentation file exists
if not exist "combined_presentation.tex" (
    echo [ERROR] combined_presentation.tex not found in:
    echo %PRESENTATION_DIR%
    echo.
    echo Please ensure the presentation file is in the same directory as this script.
    pause
    exit /b 1
)

echo [INFO] Compiling: combined_presentation.tex
echo [INFO] Working directory: %PRESENTATION_DIR%
echo.

REM Set compilation options
set XELATEX_OPTS=-interaction=nonstopmode -shell-escape

REM Run XeLaTeX multiple times for complete resolution
echo ═══════════════════════════════════════════════════════════════════════
echo Compiling Pass 1 of 3...
echo ═══════════════════════════════════════════════════════════════════════
xelatex %XELATEX_OPTS% combined_presentation.tex

echo.
echo ═══════════════════════════════════════════════════════════════════════
echo Compiling Pass 2 of 3...
echo ═══════════════════════════════════════════════════════════════════════
xelatex %XELATEX_OPTS% combined_presentation.tex

echo.
echo ═══════════════════════════════════════════════════════════════════════
echo Compiling Pass 3 of 3...
echo ═══════════════════════════════════════════════════════════════════════
xelatex %XELATEX_OPTS% combined_presentation.tex

REM Check if PDF was created
if exist "combined_presentation.pdf" (
    echo.
    echo ╔═══════════════════════════════════════════════════════════════════════╗
    echo ║                         SUCCESS!                                      ║
    echo ╚═══════════════════════════════════════════════════════════════════════╝
    echo.
    echo [OUTPUT] combined_presentation.pdf
    for %%I in (combined_presentation.pdf) do echo [SIZE]  %~zI bytes
    echo.
    
    REM Clean up auxiliary files
    echo [INFO] Cleaning up auxiliary files...
    del /q combined_presentation.aux combined_presentation.log 2>nul
    del /q combined_presentation.nav combined_presentation.out 2>nul
    del /q combined_presentation.snm combined_presentation.toc 2>nul
    del /q combined_presentation.vrb combined_presentation.xdv 2>nul
    del /q *.fls *.fdb_latexmk 2>nul
    
    echo [INFO] Auxiliary files cleaned.
    echo.
    
    REM Open the PDF
    echo [INFO] Opening PDF...
    start "" "combined_presentation.pdf"
    
) else (
    echo.
    echo ╔═══════════════════════════════════════════════════════════════════════╗
    echo ║                     COMPILATION FAILED                                ║
    echo ╚═══════════════════════════════════════════════════════════════════════╝
    echo.
    echo [ERROR] PDF file was not created.
    echo.
    echo [INFO] Check combined_presentation.log for error messages.
    echo.
    echo Common solutions:
    echo   1. Install missing LaTeX packages using tlmgr
    echo   2. Ensure all fonts are properly installed
    echo   3. Check for syntax errors in the .tex file
    echo.
    pause
    exit /b 1
)

echo [INFO] Compilation complete!
echo.
pause
exit /b 0
