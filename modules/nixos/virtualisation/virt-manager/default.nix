{ pkgs, userConfig, ... }: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [
    "${userConfig.name}"
  ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virtiofsd
  ];
}
