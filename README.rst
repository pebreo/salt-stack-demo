About
-----
Salt is a Python-based provisioning utility like Chef or Puppet. It uses the concepts of master, minions, and state files. 
A master is a machine that tells minions what software it should install. State files are conf files that describe what software 
needs to be loaded into a minion.

Setup
-----
1. Create and connect to Vagrant box

.. code:: bash
  # Download VirtualBox + extensions: https://www.virtualbox.org/wiki/Downloads
  # Download Vagrant: https://www.vagrantup.com/downloads
  $ vagrant init 
  $ vagrant box add devserver http://files.vagrantup.com/precise32.box
  $ vagrant up
  $ vagrant ssh

2. Install Salt stack

3. Edit minion and master files
/etc/salt/minion
/etc/salt/master

# check connection
sudo salt '*' 

4. Create state files

5. Run state files
sudo salt '*' state.highstate
