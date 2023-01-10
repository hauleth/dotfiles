{ config
, pkgs
, ...
}:
let
  nvim = pkgs.neovim.override {
    configure = {
      # Add Fennel to Lua path and require basic implementation
      customRC = ''
        lua << EOF
        package.path = package.path .. ";${pkgs.luajitPackages.fennel}/share/lua/5.1/?.lua"
        require('basic')
        EOF
      '';
      packages.vimPackages = with pkgs.vimPlugins; {
        start = [
          packer-nvim
          nvim-treesitter.withAllGrammars
        ];

        opt = [ ];
      };
    };
  };
in
{
  environment.variables.EDITOR = "nvim";
  environment.systemPackages = [ nvim ];
}
