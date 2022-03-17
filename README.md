# elk-setup prerequists
1.first after cloning the repo move to this dir "elk-setup/ansible-setup/" and build the docker image with the following command.

  docker build -t ansible:2.9 .

2. After building the repo move into this directory "elk-setup/docker-compose/vars/" and update ip in inventory.yml and add your private ssh key into key.pem file after building run the following command
   
 docker run --rm -it -v ${PWD}/elk-setup/docker-compose:/ansible/playbooks ansible:2.9 playbook.yaml -e "@vars/default.yaml" -i /ansible/playbooks/vars/inventory.yml
 
 
 Control variables
 
 ![image](https://user-images.githubusercontent.com/47210393/158875375-3678e86c-93d9-43bd-8beb-3d2757dcaeab.png)

 

