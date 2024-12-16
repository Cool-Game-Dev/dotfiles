{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ git killall btop micro kitty man ];
}
