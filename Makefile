DOCKER := $(shell { command -v podman || command -v docker; })
TIMESTAMP := $(shell date -u +"%Y%m%d%H%M%S")
detected_OS := $(shell uname)  # Classify UNIX OS
ifeq ($(strip $(detected_OS)),Darwin) #We only care if it's OS X
SELINUX1 :=
SELINUX2 :=
else
SELINUX1 := :z
SELINUX2 := ,z
endif

.PHONY: all clean

all:
	$(DOCKER) build --tag zmk --file Dockerfile .
	$(DOCKER) run --rm -it --name zmk \
		-v $(PWD)/firmware:/app/firmware$(SELINUX1) \
		-v $(PWD)/config:/app/config:ro$(SELINUX2) \
		-e TIMESTAMP=$(TIMESTAMP) \
		zmk

clean:
	rm -f firmware/*.uf2
	$(DOCKER) image rm zmk docker.io/zmkfirmware/zmk-build-arm:stable

write-latest-left:
	[ -d /Volumes/ADV360PRO ] && rsync "$(ls -Art firmware/*left.uf2 | tail -n 1)" /Volumes/ADV360PRO/ || echo "Kinesis Advantage360 is not in bootload mode!"

write-latest-right:
	[ -d /Volumes/ADV360PRO ] && rsync "$(ls -Art firmware/*right.uf2 | tail -n 1)" /Volumes/ADV360PRO/ || echo "Kinesis Advantage360 is not in bootload mode!"

write-left:
	[ -d /Volumes/ADV360PRO ] && rsync "$(fd '.*left.uf2' firmware | fzf)" /Volumes/ADV360PRO/ || echo "Kinesis Advantage360 is not in bootload mode!"

write-right:
	[ -d /Volumes/ADV360PRO ] && rsync "$(fd '.*right.uf2' firmware | fzf)" /Volumes/ADV360PRO/ || echo "Kinesis Advantage360 is not in bootload mode!"

tasks:
	grep -oP '^([^ .:]+)(?=:)' Makefile | sort

