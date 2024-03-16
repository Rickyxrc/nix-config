deploy: switch-system switch-home

switch-system:
  sudo nixos-rebuild switch --flake .

switch-home:
  home-manager --flake . switch

add-xiaohe-word:
  nvim ~/nix-config/overlays/fcitx5/rime-data-flypy/share/rime-data/flypy_user.txt
  just switch-home
  git add .
  git commit -m "feat(fcitx5): add custom word[by snippet]"
  kitty htop # kill fcitx5 manually lol.

ax: add-xiaohe-word

update-flake:
  nix flake update

# usage: just update-flake i=nixpkgs
update-flake-specific:
  nix flake lock --update-input $(i)

history:
  nix profile history --profile /nix/var/nix/profiles/system

gc: clean-profile clean-package

clean-profile:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

clean-package:
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old

rclone:
  rclone sync ~/archive-zipped onedrive:/code-archive --transfers 1 --progress
