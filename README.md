# Yet Another `pip2nix`

A simple Python script that piggy-backs on `pip` itself to generate
`Nix` derivations for a set of Python dependencies.

## The Scenario
You have -- or can write -- a [`requirements.txt`](https://pip.pypa.io/en/stable/user_guide/#requirements-files) for a Python project you'd like to work on or run. Now you want to use [nix](http://nixos.org/nix/) to build and install these packages in its own environment.

## Rising Action

```
$ cd pip2nix
$ nix-shell
$ cd ../my-project
$ pip2nix requirements.txt -o pip_packages.nix
```

## Conclusion

Now you have a `pip_packages.nix` you can import into your own `shell.nix`. It might look something like this,

```
{ pkgs ? import <nixpkgs> {} }:
(pkgs.python27.buildEnv.override {
  extraLibs = builtins.attrValues (import ./pip_packages.nix {
    inherit (pkgs) fetchurl;
    inherit (pkgs.python27Packages) buildPythonPackage;
  });
}).env
```
