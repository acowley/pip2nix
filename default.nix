{ stdenv, buildPythonApplication, pip }:
buildPythonApplication {
  name = "pip2nix";
  srcs = [./pip2nix ./setup.py ];
  buildInputs = [ pip ];
}
