About
-----

Setup
-----
1. Create and connect to Vagrant box
vagrant init
vagrant add 
vagrant up
vagrant ssh

2. Install Salt stack

3. Edit minion and master files
/etc/salt/minion
/etc/salt/master

# check connection
sudo salt '*' 

4. Create state files

5. Run state files
sudo salt '*' state.highstate