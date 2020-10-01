{ pkgs ? import <nixpkgs> {} }:
with pkgs;
[
  (python3.withPackages(ps: with ps; [ pygments pynvim pip]))
  fd
  global
  ripgrep
  ag
  rustc
  cargo
  go
  neovim
  universal-ctags
  ptags
]
