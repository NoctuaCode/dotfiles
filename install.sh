#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

cp -r ./nix ~/.config/nix

cp -r ./nix-darwin ~/.config/nix-darwin

nix run nix-darwin -- switch --flake ~/.config/nix-darwin

darwin-rebuild switch --flake ~/.config/nix-darwin
