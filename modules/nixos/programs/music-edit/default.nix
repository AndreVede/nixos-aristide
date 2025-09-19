{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    musescore
    muse-sounds-manager
    lmms
  ];

  services.pipewire = {
    jack.enable = true;
  };
}
