==========================
django-docker-cookiecutter
==========================

Usage
-----

Generate a Python package project::

    cookiecutter https://github.com/rgreinho/django-docker-cookiecutter

A working git repo for pbr to work, on newer versions of cookiecutter (>= 0.7.0 released 2013-11-09) this inital commit will be done automatically. Otherwise you will need to init a repo and commit to it before doing anything else::

    cd $repo_name
    git init
    git add .
    git commit -a

Then:

* Add the project to your GitHub account.

Not Exactly What You Want?
---------------------------

This is what I want. *It might not be what you want.* Don't worry, you have options:

Fork This
"""""""""

If you have differences in your preferred setup, I encourage you to fork this to create your own version.
Once you have your fork working, let me know and I'll add it to a '*Similar Cookiecutter Templates*' list here.
It's up to you whether or not to rename your fork.

If you do rename your fork, I encourage you to submit it to the following places:

* cookiecutter_ so it gets listed in the README as a template.
* The cookiecutter grid_ on Django Packages.

.. _cookiecutter: https://github.com/audreyr/cookiecutter
.. _grid: https://www.djangopackages.com/grids/g/cookiecutters/

Or Submit a Pull Request
""""""""""""""""""""""""

We also accept pull requests on this, if they're small, atomic, and if they make our own project development
experience better.
