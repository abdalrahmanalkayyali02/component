#!/bin/bash

message() {
  echo "Select compression format: "
  echo "1. zip"
  echo "2. gz"
  echo "3. xz"
  echo "4. tar"
  echo "0. exit"
}

usage() {
  echo "Usage: $0 [folder_name]"
  echo "Compresses the specified folder into the chosen format."
  echo "Available formats: zip, gz, xz, tar"
  exit 1
}

if [ $# -ne 1 ]; then
  usage
fi

FOLDER_NAME=$1

# Check if the specified folder exists
if [ ! -d "$FOLDER_NAME" ]; then
  echo "Error: Folder '$FOLDER_NAME' does not exist."
  exit 1
fi

# Main loop
while true; do
  message
  read -p "Enter the number corresponding to your choice: " choice

  # Exit if user enters 0
  if [ "$choice" -eq 0 ]; then
    echo "Exiting..."
    break
  fi

  # Get current date and time
  DATE=$(date +"%Y%m%d%H%M%S")

  case $choice in
  1)
    # Compress with zip
    zip -r "${FOLDER_NAME}_${DATE}.zip" "$FOLDER_NAME"
    echo "Folder compressed into ${FOLDER_NAME}_${DATE}.zip"
    ;;

  2)
    # Compress with gz
    tar -czf "${FOLDER_NAME}_${DATE}.tar.gz" "$FOLDER_NAME"
    echo "Folder compressed into ${FOLDER_NAME}_${DATE}.tar.gz"
    ;;

  3)
    # Compress with xz
    tar -cJf "${FOLDER_NAME}_${DATE}.tar.xz" "$FOLDER_NAME"
    echo "Folder compressed into ${FOLDER_NAME}_${DATE}.tar.xz"
    ;;

  4)
    # Compress with tar (without additional compression)
    tar -cf "${FOLDER_NAME}_${DATE}.tar" "$FOLDER_NAME"
    echo "Folder compressed into ${FOLDER_NAME}_${DATE}.tar"
    ;;

  *)
    echo "Invalid choice. Please select a valid option."
    ;;
  esac
done
