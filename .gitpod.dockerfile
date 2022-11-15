FROM gitpod/workspace-base

RUN addgroup --system nixbld && adduser gitpod nixbld && mkdir /nix && chown gitpod /nix && mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf


