#!/bin/sh

if [ $# = 0 ]; then
  echo "No target supplied"
  exit 1
else
  for target in $*; do
    theme_path=$(grep -F '#include "themes/' theme.h | sed -n 's:.*"\([^"]*\)":\1:p')

    # create theme folder in target utility / program
    [ -d "$target/themes" ] || mkdir "$target/themes"

    cp theme.h "$target/"
    cp "$theme_path" "$target/themes/"
  done
fi
