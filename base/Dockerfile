FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y build-essential git curl m4 pkg-config \
    unzip libgmp-dev python3 gh

# Install opam
RUN echo "" | bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"

# Create a user
RUN useradd -m ocaml
USER ocaml
WORKDIR /home/ocaml

# Initialize opam (without a switch yet)
RUN opam init --reinit --bare --disable-sandboxing -y

# Update remote to track ocaml/opam-repository
RUN opam remote set-url default https://github.com/ocaml/opam-repository.git \
    && opam update

ENTRYPOINT [ "opam", "exec", "--" ]
CMD [ "bash" ]
