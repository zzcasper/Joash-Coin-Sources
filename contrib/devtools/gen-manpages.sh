#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

JNITACOIND=${JNITACOIND:-$SRCDIR/jnitacoind}
JNITACOINCLI=${JNITACOINCLI:-$SRCDIR/jnitacoin-cli}
JNITACOINTX=${JNITACOINTX:-$SRCDIR/jnitacoin-tx}
JNITACOINQT=${JNITACOINQT:-$SRCDIR/qt/jnitacoin-qt}

[ ! -x $JNITACOIND ] && echo "$JNITACOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
JTKVER=($($JNITACOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoind if --version-string is not set,
# but has different outcomes for bitcoin-qt and bitcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$JNITACOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $JNITACOIND $JNITACOINCLI $JNITACOINTX $JNITACOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${JTKVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${JTKVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
