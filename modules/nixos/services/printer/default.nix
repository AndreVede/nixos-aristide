{ pkgs, ... }: {
  services = {
    # CUPS
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        gutenprintBin
        hplip
        hplipWithPlugin
        cnijfilter2
      ];
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  environment.systemPackages = with pkgs; [
    system-config-printer
  ];
}
