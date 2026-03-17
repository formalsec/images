FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV OPAMROOTISOK=1

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential git curl m4 pkg-config unzip cmake ninja-build jq gh sudo patch rsync ssh \
    libgmp-dev libssl-dev zlib1g-dev libffi-dev \
    python3 python3-pip python3-venv

# Install nodejs
RUN apt-get update && apt-get install -y --no-install-recommends nodejs npm

# Install opam
RUN echo "" | bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"

# Create a user (optional, for non-CI use)
RUN useradd -m ocaml && \
    mkdir -p /etc/sudoers.d && \
    echo "ocaml ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ocaml && \
    chmod 0440 /etc/sudoers.d/ocaml

# Initialize opam (without a switch yet) as root
RUN opam init --reinit --bare --disable-sandboxing -y

# We add opam.ocaml.org as primary remote and opam-repo with rank 2 for updated packages
RUN opam remote set-url default https://opam.ocaml.org --set-default && \
  opam remote add opam-repo https://github.com/ocaml/opam-repository.git --rank=2 --set-default

# Fix "dubious ownership" errors in CI by trusting all directories system-wide
RUN git config --system --add safe.directory '*'

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "bash" ]
