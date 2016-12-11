{ stdenv, buildPythonApplication, pip, nix, cacert }:
buildPythonApplication {
  name = "pip2nix";
  src = ./.;
  buildInputs = [ cacert ];
  propagatedBuildInputs = [ pip nix ];
  inherit cacert;
  setupHook = ./setup-hook.sh;
}
