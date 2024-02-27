#!/bin/bash
for i in "$@"; do
   if ! grep -q "$i" ~/.config/gtk-3.0/bookmarks; then
      echo "$i" >> ~/.config/gtk-3.0/bookmarks
   fi
done
