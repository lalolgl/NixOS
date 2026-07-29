final: prev: {
  kew = final.stdenv.mkDerivation {
    pname = "kew";
    version = "dev";

    src = final.fetchFromGitHub {
      owner = "ravachol";
      repo = "kew";
      rev = "master";
      hash = "sha256-mVh3XaGmYrGYkmBbd7gB0LszfqYPCBLjx9xL5yDZux0=";
    };

    nativeBuildInputs = with final; [
      pkg-config
      autoPatchelfHook
    ];

    buildInputs = with final; [
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

    runtimeDependencies = with final; [
      libpulseaudio
      alsa-lib
    ];

    postPatch = ''
      substituteInPlace Makefile \
        --replace-fail '$(shell uname -s)' 'Linux' \
        --replace-fail '$(shell uname -m)' '${final.stdenv.hostPlatform.parsed.cpu.name}'
    '';

    makeFlags = [
      "MAN_DIR=$out/share/man"
      "PREFIX=$out"
    ];

    meta = {
      description = "Command-line music player for Linux";
      homepage = "https://github.com/ravachol/kew";
      #license = prev.licenses.gpl2Only;
      mainProgram = "kew";
    };
  };
}
