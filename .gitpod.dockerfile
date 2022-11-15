FROM gitpod/workspace-base

USER root

RUN addgroup --system nixbld && adduser gitpod nixbld && mkdir /nix && chown gitpod /nix && mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf

CMD /bin/bash -l
USER gitpod
WORKDIR /home/gitpod

RUN curl -L https://nixos.org/nix/install > install.sh && sh ./install.sh --no-daemon

RUN echo '. /home/gitpod/.nix-profile/etc/profile.d/nix.sh' >> /home/gitpod/.bashrc
RUN mkdir -p /home/gitpod/.config/nixpkgs && echo '{ allowUnfree = true; }' >> /home/gitpod/.config/nixpkgs/config.nix
