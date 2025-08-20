{ userConfig, ... }: {
  home.file.".face" = {
    source = userConfig.avatar;
  };
}
