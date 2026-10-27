#!/bin/bash


cd "$(dirname "$0")"


newman run "pet story.postman_collection.json" --folder "Petstore-E2E-Tests" -r htmlextra --reporter-htmlextra-export "newman/final_report.html" --reporter-htmlextra-browserTitle "API Test Report"


start "" "./final_report.html"

echo "Тесты выполнены! Нажмите любую клавишу для закрытия..."
read -n 1
