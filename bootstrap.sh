#!/bin/bash

# Check if Ansible is already installed
if ! command -v ansible &>/dev/null; then
	echo "Installing Ansible..."
	sudo apt update
	sudo apt install -y ansible
else
	echo "Ansible is already installed."
fi

# Define the GitHub repository URL and playbook file
github_repo="https://github.com/fxdgear/my-dev-stack-ansible"
playbook_file="dev-setup.yml"
ansible_project_name="my-dev-stack-ansible" # Declare the variable here

# Clone the GitHub repository or update it if it already exists
if [ -d "$ansible_project_name" ]; then
	echo "Updating the Ansible project..."
	cd "$ansible_project_name"
	git pull
else
	echo "Cloning the Ansible project..."
	git clone "$github_repo" "$ansible_project_name" # Use double quotes to handle spaces or special characters in URLs
	cd "$ansible_project_name"
fi

# Run the Ansible playbook
echo "Running the Ansible playbook..."
ansible-playbook -i localhost, "$playbook_file" --ask-become-pass -v
# Clean up (optional)
cd ..
rm -rf "$ansible_project_name"

echo "Ansible setup complete."
