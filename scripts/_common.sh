#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# MyPads version
# This variable is mostly used to force an upgrade of the package in case of new versions of MyPads.
mypads_version=2.0.1

# pnpm version -> must track the "packageManager" field of Etherpad's own
# package.json, so corepack installs what upstream tested against rather than
# whatever "pnpm@latest" happens to be that day.
pnpm_version=11.0.6

# Plugin versions -> https://static.etherpad.org/index.html
ep_align_version=11.0.43
ep_author_hover_version=11.0.34
ep_delete_empty_pads_version=0.0.11
ep_headings2_version=0.2.125
ep_font_size_version=0.4.113
