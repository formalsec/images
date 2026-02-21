FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    m4 \
    pkg-config \
    unzip \
    libgmp-dev \
    python3 \
    python3-pip \
    gh \
    sudo \
    libssl-dev \
    zlib1g-dev \
    patch \
    cmake \
    ninja-build \
    jq \
    rsync \
    libffi-dev

# Install opam
RUN echo "" | bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"

# Create a user (optional, for non-CI use)
RUN useradd -m ocaml && \
    mkdir -p /etc/sudoers.d && \
    echo "ocaml ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ocaml && \
    chmod 0440 /etc/sudoers.d/ocaml

# Initialize opam (without a switch yet) as root
RUN opam init --reinit --bare --disable-sandboxing -y

# Update remote to track ocaml/opam-repository
RUN opam remote set-url default https://github.com/ocaml/opam-repository.git \
    && opam update

# Fix "dubious ownership" errors in CI by trusting all directories system-wide
RUN git config --system --add safe.directory '*'

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
