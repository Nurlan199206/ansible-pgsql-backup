**Software version**

```Ansible: 2.15.2```


```docker run --rm -it -v /home/nurlan/:/root/ willhallonline/ansible:2.15.2-alpine-3.16 ansible-playbook -i /root/backup/inventory /root/backup/tasks/main.yml --ssh-common-args='-o StrictHostKeyChecking=no'```
