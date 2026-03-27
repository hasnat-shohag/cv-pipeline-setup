#!/bin/bash

# LaTeX CV Build Script
# This script compiles the CV and optionally cleans up temporary files

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

echo "Building CV..."
pdflatex -interaction=nonstopmode template.tex > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✓ Build successful!"
    echo "PDF generated: cv.pdf"
    
    echo "Cleaning temporary files..."
    rm -f *.aux *.log *.out *fdb_latexmk *fls
    echo "✓ Cleaned!"
else
    echo "✗ Build failed! Check cv.log for errors."
    exit 1
fi
