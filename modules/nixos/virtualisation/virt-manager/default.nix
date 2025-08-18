{ pkgs, userConfig, ... }: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [
    "${userConfig.name}"
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    spiceUSBRedirection.enable = true;
  };
}
