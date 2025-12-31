#!/bin/bash

FILE="activity.log"

MESSAGES=(
"Update project notes"
"Fix minor issue"
"Refactor utility"
"Improve documentation"
"Cleanup code"
"Adjust configuration"
"Update dependencies"
"Add helper method"
"Optimize logic"
"Improve readability"
)

for YEAR in 2025 2024 2023
do
    for ((i=1; i<=10; i++))
    do
        MONTH=$((RANDOM % 12 + 1))

        case $MONTH in
            1|3|5|7|8|10|12) MAXDAY=31 ;;
            4|6|9|11) MAXDAY=30 ;;
            2) MAXDAY=28 ;;
        esac

        DAY=$((RANDOM % MAXDAY + 1))

        HOUR=$((RANDOM % 12 + 9))
        MINUTE=$((RANDOM % 60))
        SECOND=$((RANDOM % 60))

        DATE=$(printf "%04d-%02d-%02d %02d:%02d:%02d" \
            $YEAR $MONTH $DAY $HOUR $MINUTE $SECOND)

        MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

        echo "$DATE - $MESSAGE" >> "$FILE"

        git add .

        GIT_AUTHOR_DATE="$DATE" \
        GIT_COMMITTER_DATE="$DATE" \
        git commit -m "$MESSAGE"
    done
done
