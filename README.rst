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

1. Goto and run ``sudo vim /etc/salt/minion`` and give your minion a nickname. Locate the line #id:, and  remove the # and add a name id: `myminion`. (This name can be anything you want.)

2. Then goto the directory and run ``sudo vim /etc/salt/master`` Uncomment the line # master: salt by removing the # and replacing salt with the your master's IP address. It now should look like this: master: your.ip.address.here. (If you're doing this locally on the same machine, you can add 127.0.0.1.)

3. Next create the minion's keys. You can type ``salt-key -L`` to show all keys that need to be accepted. You should see that ``myminion`` key is not accepted yet. To accept you type ``sudo salt-key -a myminion``.

4. Check the connection by typing `` salt '*' test.ping`` or ``salt 'myminion' test.ping``


Other useful commands

.. code:: bash

  $ sudo salt '*' cmd.run "service apache2 restart"
  $ sudo salt '*' cmd.run "service httpd restart"
  $ sudo salt '*' cmd.run "uptime" # check uptime
  # Run apache bench on a minion
  $ sudo salt '*' cmd.run "ab -n 10 -c 2 http://www.google.com:80/index.html"


4. Create state files
-------------------
Salt state files are located in ``/srv/salt``. They topmost state file is called ``top.sls`` which in ``/srv/salt`` itself.
It looks something like this

.. code:: yaml

  base:
    '*':
      - servers

and you would have to make the ``servers.sls`` file like this:

.. code:: yaml

  libpam-cracklib:
  pkg:
    - installed

5. Run the state files
------------------
Finally, let's create the states by running salt: ``sudo salt '*' state.highstate``
Note that it will take time for the software to be installed.

References
=========
Getting Started with Salt: http://www.linuxjournal.com/content/getting-started-salt-stack-other-configuration-management-system-built-python?page=0,1 

Salt Install Doc: http://docs.saltstack.com/topics/installation/index.html

Salt + Docker : http://karlgrz.com/testing-salt-states-rapidly-with-docker/
