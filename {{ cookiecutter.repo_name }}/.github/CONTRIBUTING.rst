Contributing
------------

Guidelines
^^^^^^^^^^

* We are interested in various different kinds of improvement for ``{{ cookiecutter.repo_name }}``; please feel free to raise an `Issue`_ if you would like to work on something major to ensure efficient collaboration and avoid duplicate effort.
* Use the provided templates to file an `Issue`_ or a `Pull Request`_.
* Create a topic branch from where you want to base your work.
* Make sure you have added tests for your changes.
* Run all the tests to ensure nothing else was accidentally broken.
* Reformat the code by following the formatting section below.
* Submit a pull request.

Setup the developer environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The full setup is managed by Docker containers. Therefore Docker and docker-compose are the only things that you should need to install.
Please refer to the appropriate installation guides for your platform:

* `Docker <https://docs.docker.com/engine/installation>`_.
* `docker-compose <https://docs.docker.com/compose/install>`_

All the other actions are managed using the Makefile. Here is the list of available targets:

+-------------------+------------------------------------------------------+
|       Target      |                      Description                     |
+===================+======================================================+
| ci-coala          | Run the static analyzers                             |
+-------------------+------------------------------------------------------+
| ci-docs           | Ensure the documentation builds                      |
+-------------------+------------------------------------------------------+
| ci-tests          | Run the unit tests                                   |
+-------------------+------------------------------------------------------+
| clean             | Remove unwanted files in project (**!DESTRUCTIVE!**) |
+-------------------+------------------------------------------------------+
| format            | Format the codebase using YAPF                       |
+-------------------+------------------------------------------------------+
| format-check      | Check the code formatting using YAPF                 |
+-------------------+------------------------------------------------------+
| venv              | Setup local venv                                     |
+-------------------+------------------------------------------------------+
| wheel             | Build a wheel package                                |
+-------------------+------------------------------------------------------+

For instance:

.. code-block:: bash

  make ci-coala

Formatting
----------

For formatting the files properly, please use `YAPF`_.

In the root directory of the project, run the following command:

.. code-block:: bash

  yapf -r -i {{ cookiecutter.repo_name }}/

or

.. code-block:: bash

  make format

.. _`Issue`: https://github.com/{{ cookiecutter.author }}/{{ cookiecutter.repo_name }}/issues
.. _`Pull Request`: https://github.com/{{ cookiecutter.author }}/{{ cookiecutter.repo_name }}/pulls
.. _`YAPF`: https://github.com/google/yapf
