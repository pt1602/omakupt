# Updating

Omakupt doesn't track a version number to decide what needs updating. Instead, `omakupt update` → **Omakupt** (`bin/omakupt-sub/migrate.sh`) does this:

1. Records the commit date of your current `~/.local/share/omakupt` clone.
2. Runs `git pull` to fetch the latest changes.
3. Runs every script under `migrations/` whose filename (a Unix timestamp) is newer than the commit date recorded in step 1.

Each migration script runs exactly once per machine, in order, the first time `omakupt update` is run after that migration was added to the repository.

## Writing a migration

Add a new file to `migrations/`, named with the current Unix timestamp (`date +%s`) and a `.sh` extension, e.g. `migrations/1234567890.sh`. Inside it you have access to `$OMAKUPT_PATH` (the clone directory) exactly like the rest of the codebase.
