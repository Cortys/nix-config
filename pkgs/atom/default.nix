rec {
  name = "atom-${version}";
  version = "1.11.2";

  src = fetchurl {
    url = "https://github.com/atom/atom/releases/download/v${version}/atom-amd64.deb";
    sha256 = "1mvlj1j0hyvm5di95nn0x99lm5arw2amm1s1va1m73zss3bzlhpm";
    name = "${name}.deb";
  };
}
