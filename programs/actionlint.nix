{ lib, pkgs, config, ... }:
let
  cfg = config.programs.actionlint;
in
{
  options.programs.actionlint = {
    enable = lib.mkEnableOption "actionlint";
    package = lib.mkPackageOption pkgs "actionlint" { };
    directory = lib.mkOption {
      type = lib.types.path;
      default = ./.github;
      description = "The directory to run actionlint in";
    };
  };

  config = lib.mkIf cfg.enable {
    settings.formatter.actionlint = {
      command = cfg.package;
      includes = [ "*.yml" "*.yaml" ];
    };
  };
}
