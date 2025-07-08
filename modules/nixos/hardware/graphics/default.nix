{ pkgs, ... }: {
  # Activer OpenGL, VA-API et PulseAudio
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      libvdpau
    ];
  };
}
