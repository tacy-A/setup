#!/bin/bash
echo "Installing Xcode Command Line Tools..."
xcode-select --install
install_status=$?

if [ $install_status -ne 0 ]; then
  echo "Error: Failed to install Xcode Command Line Tools."
  exit 1
fi

echo "Xcode Command Line Tools has been successfully installed."
echo "Install the setup repository."

read -p "Enter your Gihub username: " username
read -sp "Enter your Gihub Access token: " token
echo
read -p "Enter the name of the repository to clone （/username/repository.git）: " repo

git clone https://${username}:${token}@github.com${repo}
status=$?

if [ $status -eq 0 ]; then
   echo "Repository clone was successful."
else
  echo "Error: Repository cloning failed."
fi