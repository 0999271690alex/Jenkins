#!/bin/bash
LOG_FILE="/var/log/apache2/access.log"  # Змініть шлях для RedHat-систем

if [[ ! -f $LOG_FILE ]]; then
    echo "Лог-файл не знайдено: $LOG_FILE"
    exit 1
fi

echo "Перевірка на помилки 4xx та 5xx у $LOG_FILE..."
grep '" [45][0-9][0-9] ' $LOG_FILE | tee /tmp/http_errors.log

if [[ -s /tmp/http_errors.log ]]; then
    echo "Знайдено помилки! Збережено у /tmp/http_errors.log"
else
    echo "Помилки 4xx/5xx не знайдено."
fi
