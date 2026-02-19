FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential git curl m4 pkg-config unzip libgmp-dev python3

# Install opam
RUN echo "" | bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"

# Create a 'set up' user (OCaml tools often dislike running as root)
RUN useradd -m ocaml
USER ocaml
WORKDIR /home/ocaml

# Initialize opam and install OCaml 5.4
RUN opam init --reinit --bare --disable-sandboxing -y \
    && opam switch create 5.4 ocaml-base-compiler.5.4.0

# Update remote to track ocaml/opam-repository
RUN opam remote set-url default https://github.com/ocaml/opam-repository.git \
    && opam update

# CRITICAL FOR CI: This ensures 'dune', 'ocamlc', etc. are always in the PATH
# without needing to run 'opam exec' every time.
ENV OPAMROOT="/home/ocaml/.opam"
ENV OPAM_SWITCH_PREFIX="/home/ocaml/.opam/5.4"
ENV OPAMCONFIRMLEVEL=unsafe-yes
ENV PATH="/home/ocaml/.opam/5.4/bin:${PATH}"

# Pre-install Dune (most GitLab OCaml projects need it)
RUN opam install dune -y

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
