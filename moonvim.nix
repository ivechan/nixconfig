{ pkgs ? import <nixpkgs> {} }: with pkgs;
let 
vim_with_python3 = pkgs.vim_configurable.override {
    python = python3Full;
};

in vim_with_python3.customize {
  # `name` specifies the name of the executable and package
  name = "vim";
  vimrcConfig.customRC = builtins.readFile(./.vimrc);
  vimrcConfig.plug.plugins = with pkgs.vimPlugins; [vim-plug];
}

