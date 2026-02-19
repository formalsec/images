FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential git curl m4 pkg-config unzip libgmp-dev \
    && rm -rf /var/lib/apt/lists/*

# Install opam
RUN echo "" | bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"

# Create a 'set up' user (OCaml tools often dislike running as root)
RUN useradd -m ocaml
USER ocaml
WORKDIR /home/ocaml

# Initialize opam and install OCaml 5.4
RUN opam init --reinit --bare --disable-sandboxing -y \
    && opam switch create 5.4 ocaml-base-compiler.5.4.0

# CRITICAL FOR CI: This ensures 'dune', 'ocamlc', etc. are always in the PATH
# without needing to run 'opam exec' every time.
ENV OPAM_SWITCH_PREFIX="/home/ocaml/.opam/5.4"
ENV PATH="/home/ocaml/.opam/5.4/bin:${PATH}"

# Pre-install Dune (most GitLab OCaml projects need it)
RUN opam install dune -y

ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]
