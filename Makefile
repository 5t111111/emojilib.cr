.PHONY: all
all: clean emojicr

emojicr: emojilib
	crystal build --release src/cli/emojicr.cr

emojilib: src/generated.cr
	crystal build --release src/emojilib.cr

src/generated.cr: yarn_install
	crystal run _generator/generator.cr

yarn_install:
	yarn install

.PHONY: clean
clean:
	$(RM) emojicr emojilib src/emojilib/generated.cr
