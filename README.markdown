vvv
---

virtualenvs in subshell. Turtle power.


Usage
-----

List all virtualenvs:

    $ vvv
    myproject
    workproject
    super-secret-project

Create a new virtualenv. This will also launch the new subshell:

    $ vvv -c myenv

Create a new virtualenv without activating it:

    $ vvv -m myenv

Activate a virtualenv:

    $ vvv myenv

Run a command in virtualenv:

    $ vvv myenv which python
    /home/djl/.virtualenvs/myenv/bin/python

    $ vvv myenv python
    >>> 2 * 3
    6

    $ vvv myenv pip install requests
    ...

Delete a virtualenv:

    $ vvv -d myenv
