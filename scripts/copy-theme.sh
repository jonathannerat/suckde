#!/bin/sh

if [ $# = 0 ]; then
  echo "No target supplied"
  exit 1
else
  for target in $*; do
    theme_path=$(grep -F '#include "themes/' theme.h | sed -n 's:.*"\([^"]*\)":\1:p')

    # create theme folder in target utility / program
    [ -d "$target/themes" ] || mkdir "$target/themes"

    cmp -s "theme.h" "$target/theme.h" || cp theme.h "$target/"
    [ -L "$target/$theme_path" ] || ln -rs "$theme_path" "$target/themes/"
  done
fi
