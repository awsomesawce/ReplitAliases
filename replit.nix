{ pkgs }: {
  deps = [
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
    pkgs.fish
    pkgs.zsh
    pkgs.nushell

    
  ];
}