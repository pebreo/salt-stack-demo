include:
- requirements

/home/vagrant/learning-salt/venv:
    virtualenv.managed:
        - no_site_packages: True
        - runas: vagrant
        - requirements: salt://django/requirements.txt
        - require:
            - pkg: python-virtualenv
