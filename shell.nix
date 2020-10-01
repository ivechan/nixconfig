{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let 
vim_with_python3 = pkgs.vim_configurable.override {
    python = pkgs.python38;
};

myPythonPackage = python-packages: with python-packages; [
    pygments
    pylint
    pip
];

myPythonWithMyPakcage = python38.withPackages myPythonPackage;

myvim = vim_with_python3.customize {
  # `name` specifies the name of the executable and package
  name = "vim";
  vimrcConfig.customRC = builtins.readFile(./.vimrc);
  vimrcConfig.plug.plugins = with pkgs.vimPlugins; [vim-plug];
};

in

pkgs.mkShell {
  name = "dev-shell";
  buildInputs = [
    myvim
    myPythonWithMyPakcage
  ];
}
