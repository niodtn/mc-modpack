EXCLUDE_DIRS=. .git .vscode export
COMMAND=packwiz modrinth export > /dev/null
EXPORT_DIR=export

EXCLUDE_PATTERN=$(shell echo $(EXCLUDE_DIRS) | sed 's/ /|/g')
ALL_DIRS=$(shell find . -maxdepth 1 -type d | sed 's|^\./||' | grep -Ev "^($(EXCLUDE_PATTERN))$$")

shell:
	nix shell nixpkgs#packwiz

build:
	@mkdir -p $(EXPORT_DIR)
	@for dir in $(ALL_DIRS); do \
		echo "Building in $$dir"; \
		( cd $$dir && $(COMMAND) ); \
		mv $$dir/*.mrpack $(EXPORT_DIR); \
	done
