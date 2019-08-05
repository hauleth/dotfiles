self: super:

{
  tokei = self.tokei.overrideDerivation (cfg: {
    buildInputs = self.stdenv.lib.optionals self.stdenv.isDarwin [
      self.libiconv
      self.darwin.apple_sdk.frameworks.Security
    ];
  });
}
