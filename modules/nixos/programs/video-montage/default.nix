{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Video and Audio montage
    kdePackages.kdenlive
  ];
}
