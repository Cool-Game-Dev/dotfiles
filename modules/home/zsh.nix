{ config, pkgs, ... }:

{
  programs.zsh = {
  	enable = true; 
  	enableCompletion = true;
  	syntaxHighlighting.enable = true;
  	plugins = [
  	  {
  	    name = "powerlevel10k";
  	    src = pkgs.zsh-powerlevel10k;
  	    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  	  }
  	];

  	initExtraFirst = ''
      fastfetch
  	  
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      source ~/.p10k.zsh
    '';
  };
}
