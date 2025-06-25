{ pkgs, userConfig, ... }: {
  programs.git = {
    enable = true;
    userName = "${userConfig.fullName}";
    userEmail = "${userConfig.email}";
    aliases = {
      fe = "fetch origin";
      pushme = "push -u origin HEAD";
    };
  };
}
