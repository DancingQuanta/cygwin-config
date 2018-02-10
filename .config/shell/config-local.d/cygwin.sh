#!/bin/sh

# Aliases and functions

alias cygsu="cygstart --action=runas"

open() {
    case "$1" in
    *.md) vim "$1";;
    *) cygstart "$1";;
    esac
}

cpath() {
  printf "%s" "$(cygpath -wa "$1")" > /dev/clipboard
}

# Manage cygwin programs

CYG_SETUP='/tmp/setup-x86_64.exe'

update() {
  wget -NP $(dirname -- "$CYG_SETUP") http://cygwin.com/setup-x86_64.exe
  chmod 755 "$CYG_SETUP"
  "$CYG_SETUP" --no-desktop --no-shortcuts --no-startmenu --quiet-mode -K http://cygwinports.org/ports.gpg
}

alias setup='cygstart -- "$CYG_SETUP" -K http://cygwinports.org/ports.gpg'
