{ pkgs ? (import <nixpkgs> {}).pkgs,
  local ? (import <local> {}).pkgs}:

with pkgs;


let stdenvs = [pkgs.stdenv
               pkgs.llvmPackages_36.stdenv
               pkgs.llvmPackages_37.stdenv
              ];
    csmith  = local.csmith;
    seeds   = [1000 1001 1002 1003];
in
map (stdenv:
map (seed:
import ./compile.nix {stdenv = stdenv;
                      csmith = local.csmith;
                      seed   = seed;}) seeds) stdenvs
