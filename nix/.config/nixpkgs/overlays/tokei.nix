self: super:

with super;

{
  tokei = tokei.overrideDerivation (cfg: {
    buildInputs = cfg.buildInputs ++ (stdenv.lib.optionals stdenv.isDarwin [
      self.libiconv
      self.darwin.apple_sdk.frameworks.Security
    ]);
  });
}
