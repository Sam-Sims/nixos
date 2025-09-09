{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    plugins = [
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
          sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
    ];
  
    shellInit = ''
      set -g fish_greeting
    '';
    
    interactiveShellInit = ''
      # Run fastfetch on startup
      pokeget --hide-name combee | fastfetch --file-raw -
      
      # Override fzf keybindings with the ones from fzf.fish
      bind \cr _fzf_search_history
      bind -M insert \cr _fzf_search_history
    '';
  };
}