{ pkgs }: with pkgs; 
mkShell {
  packages = [
    dotnet-sdk_7
    nuget-to-nix
  ];
}
