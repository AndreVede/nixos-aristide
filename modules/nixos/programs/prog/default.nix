{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Programation tools
    python3Full
    bun
    rustup

    # Programation
    vscode-fhs
    zed-editor
  ];
}
