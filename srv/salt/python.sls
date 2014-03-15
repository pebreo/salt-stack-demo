git-core:
    pkg:
        - installed

libpq-dev:
    pkg:
        - installed

python-dev:
    pkg:
        - installed

python-pip:
    pkg:
        - installed

supervisor:
    pkg:
        - installed

virtualenv:
    pip:
        - installed
        - require:
            - pkg: python-pip
