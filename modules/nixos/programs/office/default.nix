{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # PDF modifying
    pdfslicer
    # Office work
    libreoffice-fresh
    # Support for Microsoft documents with OnlyOffice
    onlyoffice-desktopeditors
  ];
}
