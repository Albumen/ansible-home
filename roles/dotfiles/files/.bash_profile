#!/usr/bin/env bash
# check if .bashrc exists, and source it if it does
# if it doesn't, we're screwed
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
