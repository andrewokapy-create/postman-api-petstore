#!/bin/bash

# Change the current working directory to the directory where this script is located
cd "$(dirname "$0")"

# Execute the Postman automation suite using Newman CLI with the htmlextra reporter
newman run "pet_story.postman_collection.json" \
  --folder "Petstore-E2E-Tests" \
  -r htmlextra \
  --reporter-htmlextra-export "newman/final_report.html"

# Define the absolute or relative path to the generated test execution report
REPORT_PATH="newman/final_report.html"

# Determine the operating system type and open the HTML test report in the default browser
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows environment (Git Bash / Cygwin)
    start "" "$REPORT_PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS environment
    open "$REPORT_PATH"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux environment (X11/Wayland desktop session)
    xdg-open "$REPORT_PATH" 2>/dev/null || echo "Execution complete. Report generated at: $REPORT_PATH"
else
    # Headless environments or unsupported operating systems (e.g., CI/CD runners)
    echo "Execution complete. Report saved to: $REPORT_PATH"
fi

# Pause execution to keep the terminal window open for manual verification
echo "Test execution complete. Press any key to exit..."
read -n 1
