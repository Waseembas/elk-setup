# elk-setup prerequists

change into this directory elk-setup/docker/

 docker run --rm -it -v ${PWD}/elk-setup/docker:/ansible/playbooks ansible:2.9 playbook.yaml -e -i /ansible/playbooks/vars/inventory.yml

add the inventory file and private ssh file vars directory accordingly. 

1.first after cloning the repo move to this dir "elk-setup/ansible-setup/" and build the docker image with the following command.

  docker build -t ansible:2.9 .

2. After building the repo move into this directory "elk-setup/docker-compose/vars/" and update ip in inventory.yml and add your private ssh key into key.pem file after building run the following command
   
 docker run --rm -it -v ${PWD}/elk-setup/docker:/ansible/playbooks ansible:2.9 playbook.yaml -e "@vars/default.yaml" -i /ansible/playbooks/vars/inventory.yml
 
 
 Control variables
 
 ![image](https://user-images.githubusercontent.com/47210393/158875375-3678e86c-93d9-43bd-8beb-3d2757dcaeab.png)
 
 
 Backup plan 
 
 For backup plan i enable the path repo at /data directory which is shared in all dynamic elasticsearch cluster nodes so the repos backup type is "fs".
 so this shared dir act as reader and writer accordingly.
 
 this ansible playbooks enable SLM policy which is communicated over TLS based encryption.


Kibana open over https and communication between browser and kibana is based on default ca certificate
https://host-ip:5601

the default user is build-in
user:     elastic
password: Test@1234

![image](https://user-images.githubusercontent.com/47210393/158878886-f38ab84c-a570-45d7-9cea-498c11e2780b.png)



