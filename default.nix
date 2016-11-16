{ stdenv, buildPythonApplication, pip }:
buildPythonApplication {
  name = "pip2nix";
  src = ./.;
  propagatedBuildInputs = [ pip ];
}
