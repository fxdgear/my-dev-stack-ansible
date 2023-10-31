# my-dev-stack-ansible

This is a simple asible script to provision my laptop. 

Easiest way to use this is to just run this command: 

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/fxdgear/my-dev-stack-ansible/main/bootstrap.sh)"
```

This will download the bootstrap script, ensure that ansible and git are installed and then proceed to clone the 
repo and run the playbook then delete the repo afterwards. 


