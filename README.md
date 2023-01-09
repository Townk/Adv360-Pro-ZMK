# ADV360-PRO-ZMK Thiago's Layout

Years ago I became obsessed about split keyboards. I borrow a Kinesis Advantage (1st Gen) from a friend to check the feel of typing into one of those. I loved and hated at the same time. I loved because was the first time I didn't have to bend my wrist to type, but I hated because of the layout and the awful function keys on that model.

I end up buying an ErgoDox EZ and spend weeks tweaking its layout. I even hack the QMK firmware so it would do what I wanted. Unfortunately, the ErgoDox flat design would still bother me, so I kept looking for the keyboard I would end with. I got an ErgoDox Shine, and later a MoonLander Mark I.

In the end of 2022, I found that Kinesis had released a split keyboard version of the Kinesis, and with the possibility to hack its firmware (also, they got rid of the awful function row they had). As a Christmas gift to myself, I got a Kinesis Advantage 360 for me, and this repository is the result of my adapting all my custom layouts into a ZMK configuration.

## Notable Features

Mostly, this layout is a standard QWERTY layout with some smart modifier keys spread across its keys. Next are the features I believe to make this layout unique.

### 3 Functional Layers

I decided to not go over the top with my layers. This layout has the main layer (which is the one with the standard keys in it), a function layer used to host all function keys (F1, F2, F3, ...) and some extra functionality, and a NUM-PAD layer, which is used to make the right side of the keyboard to behave like a numeric keyboard.

Besides their main purpose, each layer has some special keys that I felt it made sense with its designated layer. Among them:

- **Main Layer**: Has momentary layer switching plus the QMK _`MEH`_ and _`HYPER`_ keys;
- **Function Layer**: Has the arrow keys on the same place as the `hjkl` keys (I'm a Vim user), and common programming language symbols like `{` and `}`, and `[` and `]`.
- **NUM-PAD Layer**: Has keys to put the keyboard on _bootloader_ mode, and keys to switch the current Bluetooth profile.

### Home Row Momentary Layer

This layout has dedicated keys to switch between layers that are located on the outside-lower part of each half of the keyboard. If you hold them and press any other key, when released, the layer is turned off, and if you tap the key, the layer stays active until it is explicitly turned off.

This works pretty well in the majority of the scenarios, but when you're typing something and you need to access a key in one of the other layers, this arrangement is not so optimal.

To mitigate this issue, I added a momentary layer switch to the keys `A`, `Z`, `;`, and `/`. If you look into your keyboard, you'll realize that those keys are accessed with your pinky finger. Their layer switch are symmetric, meaning that `A` and `;` toggle the same layer, and `Z` and `/` also toggle the same layer. Naturally, I have the top keys (`A` and `;`) toggling layer 1 (the functional layer), while the bottom keys (`Z` and `/`) toggle the layer 2 (the NUM-PAD layer).

This arrangement allows me to navigate any application using keys without moving my hand from the home-row.

### Space Cadet

While playing with QMK and the ErgoDox, I saw a neat key combo that I adopted in my layout. It makes both shift keys to output an open or close parenthesis (depending with one you tap). They call this key combo the _"space cadet"_, so I using the same name to give credit where credit is due.

### Caps-Word

This is a new addition to my layout, and I found about it only after reading the ZMK guide to allow me to write this layout. When you press this key, the next word will be output as if the caps-lock key was pressed, and immediately after you press a non-word key, the effect is turned off.

## GUI Configurator

I'm not sure if the problem is the Kinesis GUI web configurator or my layout, but unfortunately, you won't be able to load this layout on the web configurator. When (or if) this is fixed, I will update this section of the README.

## References

This section contains the original information from the forked repository. I let it here as a convenience in case I need it in the future.

### To build Firmware in GitHub Actions

#### Setup

1. Fork this repo.
2. Enable GitHub Actions on your fork.

#### Build firmware

1. Push a commit to trigger the build.
2. Download the artifact.

### Local building in a container

#### Setup

##### Software

Either Podman or Docker is required, Podman is preferred if both are present.\
Make is also required

##### Windows specific

If compiling on Windows use WSL2 and Docker [Docker Setup Guide](https://docs.docker.com/desktop/windows/wsl/).\
Install make using `sudo apt-get install make`.\
The repository can be cloned directly into the WSL2 instance or accessed through the C: mount point WSL provides by default (`/mnt/c/path-to-repo`).

#### Build firmware

1. Execute `make`.
2. Check the `firmware` directory for the latest firmware build.

#### Cleanup

The built docker container and compiled firmware files can be deleted with `make clean`.

### Flashing firmware

Follow the programming instruction on page 8 of the [Quick Start Guide](https://kinesis-ergo.com/wp-content/uploads/Advantage360-Professional-QSG-v8-25-22.pdf) to flash the firmware.

### Other support

Further support resources can be found on Kinesis.com
https://kinesis-ergo.com/support/kb360pro/#firmware-updates
https://kinesis-ergo.com/support/kb360pro/#manuals
