FROM gitpod/workspace-base

RUN sh <(curl -L https://nixos.org/nix/install)
RUN echo '. /home/gitpod/.nix-profile/etc/profile.d/nix.sh' >> /home/gitpod/.bashrc
RUN nix profile install github:cachix/cachix/latest && cachix use devenv
RUN nix profile install github:cachix/devenv/v0.2

