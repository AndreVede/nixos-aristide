{ pkgs, ... }: {
  environment.systemPackages = [
    musescore
    muse-sounds-manager
    lmms
  ];

  services.pipewire = {
    jack.enable = true;
  };
}
