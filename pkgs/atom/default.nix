rec {
	name = "atom-${version}";
	version = "1.12.2";

	src = fetchurl {
		url = "https://github.com/atom/atom/releases/download/v${version}/atom-amd64.deb";
		sha256 = "03kznbxfxyjq9fqq1jvq3gvvy50dz3wqvn098n9k9gv8x3595mw4";
		name = "${name}.deb";
	};
}
