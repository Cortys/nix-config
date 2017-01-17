{ stdenv, fetchurl, lib, makeWrapper, gvfs, atomEnv, libXScrnSaver, libxkbfile, ... }: rec {
	name = "gitkraken-${version}";
	version = "1.9.1";

	src = ./gitkraken-amd64.tar.gz;

	nativeBuildInputs = [ makeWrapper ];

	buildCommand = ''
	    mkdir -p $out/usr/
	    ar p $src data.tar.gz | tar -C $out -xz ./usr
	    substituteInPlace $out/usr/share/applications/atom.desktop \
	    	--replace /usr/share/atom $out/bin
	    mv $out/usr/* $out/
	    rm -r $out/share/lintian
	    rm -r $out/usr/
	    wrapProgram $out/bin/atom \
			--prefix "PATH" : "${gvfs}/bin" \
			--prefix LD_PRELOAD : ${stdenv.lib.makeLibraryPath [ libXScrnSaver ]}/libXss.so.1 \
			--prefix LD_PRELOAD : ${stdenv.lib.makeLibraryPath [ libxkbfile ]}/libxkbfile.so.1
	    fixupPhase
	    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
			--set-rpath "${atomEnv.libPath}:$out/share/atom" \
			$out/share/atom/atom
	    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
			--set-rpath "${atomEnv.libPath}" \
			$out/share/atom/resources/app/apm/bin/node
	    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
			$out/share/atom/resources/app.asar.unpacked/node_modules/symbols-view/vendor/ctags-linux
	'';
}
