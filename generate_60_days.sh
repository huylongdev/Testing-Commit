#!/bin/bash

FILE="activity.log"

touch "$FILE"

MESSAGES=(
"Fix validation issue"
"Refactor service layer"
"Update README"
"Improve error handling"
"Add unit tests"
"Optimize query"
"Clean code"
"Update configuration"
"Fix edge case"
"Improve logging"
"Add documentation"
"Refactor controller"
"Update dependencies"
"Improve UI logic"
"Fix bug in workflow"
"Enhance performance"
"Implement feature update"
"Adjust project structure"
"Add helper functions"
"Cleanup unused imports"
)

for ((i=59; i>=0; i--))
do
    DAY=$(date -v-${i}d "+%Y-%m-%d")

    # 1-4 commits ngẫu nhiên mỗi ngày
    COMMITS=$((RANDOM % 4 + 1))

    for ((j=1; j<=COMMITS; j++))
    do
        HOUR=$((RANDOM % 14 + 8))
        MINUTE=$((RANDOM % 60))
        SECOND=$((RANDOM % 60))

        TIMESTAMP="$DAY $(printf "%02d:%02d:%02d" $HOUR $MINUTE $SECOND)"

        MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

        echo "$TIMESTAMP - $MESSAGE" >> "$FILE"

        git add .

        GIT_AUTHOR_DATE="$TIMESTAMP" \
        GIT_COMMITTER_DATE="$TIMESTAMP" \
        git commit -m "$MESSAGE"
    done
done
