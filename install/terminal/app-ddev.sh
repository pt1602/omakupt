#!/bin/bash

# DDEV is a Docker-based local development environment for PHP (and other)
# projects. The official installer downloads ddev, ddev-hostname, and mkcert,
# verifies their checksums, and runs "mkcert -install" for trusted local HTTPS.
curl -fsSL https://raw.githubusercontent.com/ddev/ddev/master/scripts/install_ddev.sh | bash
