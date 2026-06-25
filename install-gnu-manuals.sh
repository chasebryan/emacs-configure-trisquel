#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y \
  texinfo \
  info \
  gnu-standards \
  emacs-common-gfdl \
  bash-doc \
  binutils-doc \
  cpp-doc \
  gcc-doc \
  gdb-doc \
  glibc-doc \
  glibc-doc-reference \
  make-doc \
  gettext-doc \
  autoconf-doc \
  diffutils-doc \
  cpio-doc \
  tar-doc \
  m4-doc \
  readline-doc \
  indent-doc \
  bison-doc \
  flex-doc \
  gawk-doc \
  aspell-doc \
  gnutls-doc \
  mailutils-doc \
  parted-doc \
  guile-3.0-doc \
  mit-scheme-doc \
  clisp-doc \
  gcl-doc \
  gccintro \
  r-doc-info \
  octave-doc

sudo install-info --info-dir=/usr/share/info /usr/share/info/*.info.gz >/dev/null 2>&1 || true

echo "GNU manuals installed. In Emacs, use C-h i for Info, C-h G for GNU Standards, C-h E for the Emacs manual."
