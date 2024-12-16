{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ git killall btop micro-with-wl-clipboard kitty man ];
}
