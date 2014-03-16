About
=====
Salt is a Python-based provisioning utility like Chef or Puppet. It uses the concepts of master, minions, and state files. 
A master is a machine that tells minions what software it should install. State files are conf files that describe what software 
needs to be loaded into a minion.

Setup
=====

1. Create and connect to Vagrant box
------------------------------------
.. code:: bash
  
  Download VirtualBox + extensions: https://www.virtualbox.org/wiki/Downloads
  Download Vagrant: https://www.vagrantup.com/downloads
  Then:
  $ vagrant init 
  $ vagrant box add devserver http://files.vagrantup.com/precise32.box
  $ vagrant up
  $ vagrant ssh

2. Install Salt stack
--------------------
.. code:: bash
  
  $ sudo apt-get update
  $ sudo apt-get install curl vim
  # Install salt master
  $ curl -L http://bootstrap.saltstack.org | sudo sh -s -- -M -N
  # Install salt minion (on the same machine)
  $ curl -L http://bootstrap.saltstack.org | sudo sh
  

3. Edit minion and master files:
------------------------------

A. Goto and run `sudo  /etc/salt/minion` and give your minion a nickname. Locate the line #id:, and  remove the # and add a name id: `myminion`. 
  (This name can be anything you want.)

B. Next goto the directory and run `sudo vim /etc/salt/master` Uncomment the line # master: salt by removing the # and replacing salt with the your master's IP address. 
  It now should look like this: master: your.ip.address.here. (If you're doing this locally on the same machine, you can add 127.0.0.1.)

C. Check connection
  sudo salt '*' 



4. Create state files

5. Run state files
sudo salt '*' state.highstate


References
=========
Getting Started with Salt: http://www.linuxjournal.com/content/getting-started-salt-stack-other-configuration-management-system-built-python?page=0,1 

Salt Install Doc: http://docs.saltstack.com/topics/installation/index.html

Salt + Docker : http://karlgrz.com/testing-salt-states-rapidly-with-docker/
