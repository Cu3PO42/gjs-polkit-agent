{ lib
, stdenv
, meson
, pkg-config
, ninja
, gobject-introspection
, gjs
#, wrapGAppsHook
, polkit
, extraPackages ? [ ]
, buildTypes ? false
}:

stdenv.mkDerivation {
  pname = "gjs-polkit-agent";
  version = "0.1";

  src = ./.;

  mesonFlags = builtins.concatLists [
    (lib.optional buildTypes "-Dbuild_types=true")
  ];

  prePatch = ''
  '';

  postPatch = ''
    chmod +x generate_gir_dts.sh
    patchShebangs generate_gir_dts.sh
  '';

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
    #wrapGAppsHook
    gobject-introspection
  ];

  buildInputs = [
    gjs
    polkit
  ] ++ extraPackages;

  meta = with lib; {
    description = "A library to write Polkit Agents using GJS";
    homepage = "https://github.com/Cu3PO42/gjs-polkit-agent";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    license = [ licenses.gpl2 licenses.gpl3 ];
    meta.maintainers = [ "Cu3PO42" ];
  };
}
