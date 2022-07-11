# build a docker image
{ pkgs ? import <nixpkgs> { system = "x86_64-linux";}
}:                                    # nixpkgs package set
pkgs.dockerTools.buildLayeredImage {  # helper to build Docker image
name = "nix-hello";                   # give docker image a name
tag = "latest";                       # provide a tag
contents = [ pkgs.hello ];            # packages in docker image
}  
