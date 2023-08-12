{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:anpin/nixpkgs?ref=dotnet-check";
  outputs = inputs@{ self, nixpkgs, ... }: 
  let      
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system ; };
  in {


    packages.x86_64-linux.fs = pkgs.callPackage ./console-app.nix { dotnet-sdk = pkgs.dotnet-sdk_7; testProjectFile = "./console-app-tests/console-app-tests.fsproj"; };
    packages.x86_64-linux.cs = pkgs.callPackage ./console-app.nix { dotnet-sdk = pkgs.dotnet-sdk_7; testProjectFile = "./console-app-tests-cs/console-app-tests-cs.csproj"; };
    packages.x86_64-linux.default = self.packages.x86_64-linux.fs;

    devShells.x86_64-linux.default = pkgs.callPackage ./shell.nix { };
  };
}
