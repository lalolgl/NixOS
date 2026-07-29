{ pkgs, ... }:

{
  overlays = [
    (final: prev: {
      kew = pkgs.stdenv.mkDerivation {
        pname = "kew";
        version = "dev";

        src = pkgs.fetchFromGitHub {
          owner = "ravachol";
          repo = "kew";
          rev = "master";
          sha256 = pkgs.lib.fakeSha256;
        };

        nativeBuildInputs = with pkgs; [
          pkg-config
          autoPatchelfHook
        ];

        buildInputs = with pkgs; [
          fftwFloat.dev
          chafa
          curl.dev
          gdk-pixbuf
          glib.dev
          libopus
          opusfile
          libvorbis
          taglib
          faad2
          libogg
        ];

        runtimeDependencies = with pkgs; [
          libpulseaudio
          alsa-lib
        ];

        postPatch = ''
          substituteInPlace Makefile \
            --replace-fail '$(shell uname -s)' 'Linux' \
            --replace-fail '$(shell uname -m)' '${pkgs.stdenv.hostPlatform.parsed.cpu.name}'
        '';

        makeFlags = [
          "MAN_DIR=${pkgs.placeholder "out"}/share/man"
          "PREFIX=${pkgs.placeholder "out"}"
        ];

        meta = {
          description = "Command-line music player for Linux";
          homepage = "https://github.com/ravachol/kew";
          license = pkgs.licenses.gpl2Only;
          mainProgram = "kew";
        };
      });
    })
  ];
}
