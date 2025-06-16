{ mkFormatterModule, ... }:
{
  meta.maintainers = [ ];

  imports = [
    (mkFormatterModule {
      name = "wgslfmt";
      package = "wgsl-analyzer";
      includes = [
        "*.wgsl"
      ];
    })
  ];
}
