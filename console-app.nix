{ 
  lib
, buildDotnetModule
, stdenv
, libunwind
, libuuid
, icu
, openssl
, zlib
, curl
, dotnet-sdk
, testProjectFile
}: buildDotnetModule rec {
  inherit dotnet-sdk testProjectFile;
  pname = "console-app";
  version = "0.0.1";
  src = ./.;
  selfContainedBuild = true;

  projectFile = "./console-app";
  nugetDeps = ./deps.nix;
  disabledTests = [
  ];
  dotnetTestFlags = [
    "--logger \"html\""
  ];
  doCheck = true;
  runtimeDeps = [
    stdenv.cc.cc
    libunwind
    libuuid
    icu
    openssl
    zlib
    curl
  ];
  dotnetPackFlags = [
    "-p:PublishNativeAot=True"
  ];
  executables = [ pname ];
  packNupkg = false;
  meta = with lib; {
    homepage = "futute-console-app-domain-page-here";
    description = "My console app";
    license = licenses.mit;
    maintainers = with maintainers; [ anpin ];
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
