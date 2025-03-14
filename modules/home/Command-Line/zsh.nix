{
  config,
  pkgs,
  userSettings,
  ...
}:

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
    };

    initExtraFirst = ''
            source ~/instant-zsh.zsh
            instant-zsh-pre '%{[32m%}%{[1;42;30m%}Coolio@Hydrus%{[0m%}%{[46;32m%}%{[1;30m%}~%{[0m%}%{[44;36m%}%{[45;34m%}%{[0m%}%{[35m%}%{[0m%}
      %{[1;32m%}➜%{[0m%} '
            eval "$(starship init zsh --print-full-init)"
            source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
    '';

    initExtra = ''
      instant-zsh-post
    '';
  };

  programs.thefuck.enable = true;
}
