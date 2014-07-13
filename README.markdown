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
    $

Create a new virtualenv. This will also launch the new subshell:

    $ vvv -c myenv
    $ exit
    $

Activate a virtualenv:

    $ vvv myenv
    $

Delete a virtualenv:
    $ vvv -d myenv
    $


Tips
----

Can't tell when you're in a virtualenv? The `$VIRTUAL_ENV` environment
variable contains the path to the current virtualenv root. Add it to
your prompt!

What about running commands in the virtualenv? Tell `vvv` the
environment and command you want to run. This will run the command in
the specified virtualenv then exit:

    $ vvv myenv which python
    /home/djl/.virtualenvs/myenv/bin/python

    $ vvv myenv python
    >>> 2 * 3
    6

    $ vvv myenv pip install requests
    Downloading/unpacking requests
      Downloading requests-2.3.0-py2.py3-none-any.whl (452kB): 452kB downloaded
    Installing collected packages: requests
    Successfully installed requests
    Cleaning up...
    $
