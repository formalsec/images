#!/bin/bash
set -e

# Ensure opam environment is initialized for this script session
# (though opam exec below also handles it, opam update might need it)
# eval $(opam env)

echo "Running opam update..."
opam update

# Execute the command passed to the container using opam exec
# This ensures all environment variables for the current switch are set.
exec opam exec -- "$@"
