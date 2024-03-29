#!/bin/bash

TODAY=$(date '+%Y-%m-%d')
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
HEADER="---
date: $TODAY
title: \"$1\"
draft: true
tags: [\"TAGS_HERE\"]
summary: \"SUMMARY HERE, will be displayed under title\"
<<<<<<< HEAD
keywords:
- word1
cover:
    image: \"pics/COVER_IMAGE.PNG\"
    relative: true
    alt: \"ALT TEXT HERE\"
    caption: \"CAPTION HERE\"
=======
lang: ru

#cover:
#    image: \"pics/COVER_IMAGE.PNG\"
#    relative: true
#    alt: \"ALT TEXT HERE\"
#    caption: \"CAPTION HERE\"

description: \" Description that will be visible only in html tags\"
author: \"Maverick\"
>>>>>>> c7248e7aeb8e5edace7f748fe614de1dd4980bea
---"

if [[ $# -ne 0 ]]; then
  if [[ -d $1 ]]; then
    echo "Folder with this name already exists ! !"
    echo "Change name and re-run"
  else
    mkdir $1 && cd $1 && mkdir pics && touch index.md
    echo -e "$HEADER" >index.md
  fi
else
  notitle="draft_post_$TIMESTAMP"
  mkdir $notitle && cd $notitle && mkdir pics && touch index.md
  echo -e "$HEADER" >index.md
fi
