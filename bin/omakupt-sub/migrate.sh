#!/bin/bash

cd $OMAKUPT_PATH
last_updated_at=$(git log -1 --format=%cd --date=unix)
git pull

# Without nullglob, an empty migrations/ directory leaves the glob unexpanded, and
# the loop body chokes on the literal "*.sh" as a filename.
shopt -s nullglob
for file in $OMAKUPT_PATH/migrations/*.sh; do
  filename=$(basename "$file")
  migrate_at="${filename%.sh}"

  if [ $migrate_at -gt $last_updated_at ]; then
    echo "Running migration for $migrate_at"
    source $file
  fi
done

cd -
