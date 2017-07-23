{ stdenv, fetchurl, lib, makeWrapper, gvfs, atomEnv, libXScrnSaver, libxkbfile, ... }: rec {
	name = "atom-${version}";
	version = "1.18.0";

	src = fetchurl {
		url = "https://github.com/atom/atom/releases/download/v${version}/atom-amd64.deb";
		sha256 = "07hssch8sfyp5sji91lx4v62m8zmy9j971i968p747dwfp6g0my6";
		name = "${name}.deb";
	};

	buildCommand = ''
		mkdir -p $out/usr/
		ar p $src data.tar.xz | tar -C $out -xJ ./usr
		substituteInPlace $out/usr/share/applications/atom.desktop \
		  --replace /usr/share/atom $out/bin
		mv $out/usr/* $out/
		rm -r $out/share/lintian
		rm -r $out/usr/
		wrapProgram $out/bin/atom \
		  --prefix "PATH" : "${gvfs}/bin"
		fixupPhase
		patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
		  --set-rpath "${atomEnv.libPath}:$out/share/atom" \
		  $out/share/atom/atom
		patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
		  --set-rpath "${atomEnv.libPath}" \
		  $out/share/atom/resources/app/apm/bin/node
		find $out/share/atom -name "*.node" -exec patchelf --set-rpath "${atomEnv.libPath}:$out/share/atom" {} \;
  '';
}
