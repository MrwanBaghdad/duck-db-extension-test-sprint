{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  env.VCPKG_TOOLCHAIN_PATH = pkgs.vcpkg + "/share/vcpkg/scripts/buildsystems/vcpkg.cmake";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.cmake pkgs.vcpkg pkgs.openssl ];

  # https://devenv.sh/languages/
  languages.c.enable = true;
  languages.go.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
