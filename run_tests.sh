#!/bin/bash

# Магия: команда автоматически определяет папку, где лежит сам скрипт
cd "$(dirname "$0")"

# Запуск тестов (мы убрали жесткий путь к папке newman, теперь он создается внутри текущей папки)
newman run "pet story.postman_collection.json" --folder "New Folder" -r htmlextra --reporter-htmlextra-export "newman/final_report.html" --reporter-htmlextra-browserTitle "API Test Report"

# Автоматическое открытие отчета в браузере по умолчанию
start "" "newman/final_report.html"

echo "Тесты выполнены! Нажмите любую клавишу для закрытия..."
read -n 1