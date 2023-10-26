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
ansible-project="my-dev-stack-ansible"

# Clone the GitHub repository or update it if it already exists
if [ -d "my-dev-stack-ansible" ]; then
	echo "Updating the Ansible project..."
	cd $ansible-project
	git pull
else
	echo "Cloning the Ansible project..."
	git clone $github_repo $ansible-project
	cd $ansible-project
fi

# Run the Ansible playbook
echo "Running the Ansible playbook..."
ansible-playbook -i localhost, $playbook_file

# Clean up (optional)
cd ..
rm -rf $ansible-project

echo "Ansible setup complete."
