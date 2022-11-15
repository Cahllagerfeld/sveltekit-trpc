FROM gitpod/workspace-base

USER root

RUN addgroup --system nixbld && adduser gitpod nixbld && mkdir /nix && chown gitpod /nix && mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf

CMD /bin/bash -l
USER gitpod

RUN sh <(curl -L https://nixos.org/nix/install) --no-daemon

RUN mkdir -p /home/gitpod/.config/nixpkgs && echo '{ allowUnfree = true; }' >> /home/gitpod/.config/nixpkgs/config.nix
