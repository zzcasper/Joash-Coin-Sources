
Debian
====================
This directory contains files used to package joashcoind/joashcoin-qt
for Debian-based Linux systems. If you compile joashcoind/joashcoin-qt yourself, there are some useful files here.

## joashcoin: URI support ##


joashcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install joashcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your joashcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/joashcoin128.png` to `/usr/share/pixmaps`

joashcoin-qt.protocol (KDE)

