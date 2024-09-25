#!/bin/bash

extract() {
  local file="$1"
  local extension="${file##*.}"

  #if file extenstion end with .zip file
  if [ "$extension" = "zip" ]; then
    echo "Handling a .zip file..."
    unzip "$file"

  #if file extenstion end with .rar file
  elif [ "$extension" = "rar" ]; then
    echo "Handling a .rar file..."
    unrar x "$file"

  #if file extenstion end with .7z file
  elif [ "$extension" = "7z" ]; then
    echo "Handling a .7z file..."
    7z x "$file"

  #if file extenstion end with .tar file
  elif [ "$extension" = "tar" ]; then
    echo "Handling a .tar file..."
    tar -xf "$file"

  #if file extenstion end with .gz file
  elif [ "$extension" = "gz" ]; then
    echo "Handling a .gz file..."
    tar -xzf "$file"

  #if file extenstion end with .bz2 file
  elif [ "$extension" = "bz2" ]; then
    echo "Handling a .bz2 file..."
    bunzip2 "$file"

  #if file extenstion end with .xz file
  elif [ "$extension" = "xz" ]; then
    echo "Handling a .xz file..."
    tar -xf "$file"

  else
    echo "Unsupported file format: $extension"
    return 1
  fi
}

if [ "$#" -eq 1 ]; then
  extract "$1"
else
  echo "Usage: $0 filename"
  exit 1
fi
