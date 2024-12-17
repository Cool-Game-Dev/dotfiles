{ config, pkgs, userSettings, ... }:

{
  home.packages = [
    pkgs.zsh-fast-syntax-highlighting
    pkgs.zsh-autocomplete
    pkgs.thefuck
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      "sudo" = "sudo ";
      "rb" = "sudo nixos-rebuild switch --flake ${userSettings.dotfilesDir}";
      "hm-rb" = "home-manager switch --flake ${userSettings.dotfilesDir}";
      "fl-ud" = "nix flake update --flake  ${userSettings.dotfilesDir}";
      "rm" = "trash-put";
    };
    
    zsh-abbr = {
    	enable = true;
    	
    };
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    initExtraFirst = ''
          fastfetch
      	  
          # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
          # Initialization code that may require console input (password prompts, [y/n]
          # confirmations, etc.) must go above this block; everything else may go below.
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi

          source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
          source ~/.p10k.zsh
    '';
  };

  programs.thefuck.enable = true;
}
