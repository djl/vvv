wo
--

`wo` is a small shell script to help you quickly switch between
workspace environments. The basic workflow would be something like:

* Create a new environment with some predefined settings (called a "template")
* Activate the environment
* Do some work
* Exit the environment and return to your previous environment


## Usage

    wo create ENV [TEMPLATE] [-- ARGS...]
        Create a new environment from optional TEMPLATE
    wo rm ENV [ENV...] [-- ARGS...]
        Delete the given environments
    wo ls
        List all environments
    wo templates
        List all templates
    wo activate ENV [CMD...]
        Activate an environment
    wo current
        Show the current environment (if any)
    wo help
        Show this message and exit


## Environments

Environments are just directories stored in a specific place
(`~/.wo/envs` by default). You can store anything you like in them.

New environments are created from templates (see below for more
information on templates).

Environments are always activated in a new shell. This is done for two
main reasons:

1. It avoids having to deal with restoring any previous environments
   and all the hassle that entails.

2. It allows commands to be run inside of the environment without
   having to explicitly activate it first.

An example of running commands inside an environment:

    # The "go" template sets $GOPATH
    $ cat ~/.wo/templates/go/env
    export $GOPATH=~/prj/go/
    
    # Create the new environment
    $ wo create go-demo go
    
    # The variable isn't set outside the environment
    $ echo "\$GOPATH == $GOPATH"
    $GOPATH == 
    
    # But it is set inside the environment
    $ wo activate go-demo echo $GOPATH
    /home/djl/prj/go


## Templates

A template is a directory which contains some files. Again, anything
can be stored in here but `wo` only cares about three files:

* `env`

  A shell script that will be sourced when the new environment
  is activated.

  If you'd like to set environment variables for you environment, this
  would be the place to do it.

* `create` (optional)

  If this file exists, and is executable, this will be executed just
  after the new environment directory is created.

  Arguments passed are the path to the new environment directory and
  any extra arguments passed to the `wo create` command.

* `delete` (optional)

  If this file exists, and is executable, this will be executed just
  before the environment is deleted.

  Arguments passed are the path to the new environment directory and
  any extra arguments passed to the `wo delete` command.


Templates are just shell scripts sourced when an environment is
activated. By default, templates are stored in `~/.config/wo/templates`.

When creating a new environment, `wo` will copy the specified
template directory, if any, into your environment (as `.wo`).

If you'd rather the template files be symlinked into the environment
instead you can set the `$WO_SYMLINK_TEMPLATE` environment variable.

As templates are just shell scripts, you can do pretty much anything
you like inside them - activate a virtualenv, set the $PATH, install a
package, etc.

See the `examples` directory for some basic ideas.


## Config

Some environment variables `wo` will respect.


* `$WO_ENVS`

  The directory where environments are stored.

* `$WO_TEMPLATES`

  The directory containing your templates.

* `$WO_SYMLINK_TEMPLATE`

  Symlink, rather than copy, the template into the environment.
  This may be useful if you share a common template among multiple
  environments.

  (This variable can be set to anything)

* `$WO_AUTO_ACTIVATE`

  Activate new environments immediately after creation.

  (This variable can be set to anything)
