#!/bin/sh

# TODO:
# добавить автоматическую нумерацию файлов

TODAY=`date '+%d.%m.%Y'`
CURRENT=`pwd`
BASENAME=`basename "$CURRENT"`
NAME="${BASENAME}_${TODAY}.md"

echo "# ${TODAY}" > $NAME
