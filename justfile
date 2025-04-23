shell:
    nix shell nixpkgs#packwiz

build folder:
    mkdir -p build && cd {{ folder }} && packwiz modrinth export && mv *.mrpack ../build
