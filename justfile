default:



rebuild:
    sudo nixos-rebuild switch --flake .

update:
    sudo nix flake update

upgrade: update rebuild



gc:
    sudo nix-collect-garbage

optimise:
    sudo nix-store --optimise

list-generations:
    sudo nix profile history --profile /nix/var/nix/profiles/system

delete-older-generations threshold="30d":
    sudo nix profile wipe-history --older-than {{threshold}} --profile /nix/var/nix/profiles/system

