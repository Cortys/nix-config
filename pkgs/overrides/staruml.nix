{ stdenv, fetchurl, makeWrapper
, dpkg, patchelf
, gtk2, glib, gdk_pixbuf, alsaLib, nss, nspr, cups, libgcrypt, dbus, systemd, ... }:

rec {
  version = "2.8.0";
  name = "staruml-${version}";

  src =
    if stdenv.system == "i686-linux" then fetchurl {
      url = "http://staruml.io/download/release/v${version}/StarUML-v${version}-32-bit.deb";
      sha256 = "684d7ce7827a98af5bf17bf68d18f934fd970f13a2112a121b1f1f76d6387849";
    } else fetchurl {
      url = "http://staruml.io/download/release/v${version}/StarUML-v${version}-64-bit.deb";
      sha256 = "0b3cwpbnz3jz6wq2jp7n9f0yh8n3c5jxvbcmn5rrrv0mzq5ppyvr";
    };
}
