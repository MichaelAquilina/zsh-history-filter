Filter History
==============

|CircleCI| |Version| |GPLv3|

Zsh plugin that filters out commands from being put into your permanant history.
Particularly useful for preventing secrets being written.

* Installation_
* Contributing_
* `Running Tests`_

Usage
-----

After installation_, set the environment variable ``HISTORY_FILTER_EXCLUDE`` to an array
array of keywords file. that will be used to determine when to filter out the command from history.

Example:

::

    export HISTORY_FILTER_EXCLUDE=("_KEY" "Bearer")

Now everytime any of the keywords are contained in a command you execute,
the command will be written to internal history but be prevented from being written
to your permanant history file (i.e. your ``HISTFILE``).

In practice what this means is that the command will still be available when you
press the up and down keys on your keyboard and the ``history`` command - but only
within the same shell session. As soon as you open another terminal you will find that
the command does not exist in your history.

For example, using the ``HISTORY_FILTER_EXCLUDE`` value above -
all of the commands below will be filtered out from permanant history.

::

    curl -H "Authorization: Bearer SEKRETTOKEN" https://api.example.com
    export SOME_DEVELOPER_KEY="SEKRETKEYVALUE"


Installation
------------

Add one of the following to your ``.zshrc`` file depending on your
package manager:

ZPlug_

::

    zplug "MichaelAquilina/zsh-filter-history"

Antigen_

::

    antigen bundle "MichaelAquilina/zsh-filter-history"

Zgen_

::

    zgen load "MichaelAquilina/zsh-filter-history"

oh-my-zsh_

Copy this repository to ``$ZSH_CUSTOM/custom/plugins``, where ``$ZSH_CUSTOM``
is the directory with custom plugins of oh-my-zsh `(read more) <https://github.com/robbyrussell/oh-my-zsh/wiki/Customization/>`_:
::

    git clone https://github.com/MichaelAquilina/zsh-filter-history.git $ZSH_CUSTOM/plugins/you-should-use


Then add this line to your ``.zshrc``

::

    plugins=(you-should-use $plugins)

Contributing
------------

Pull requests and Feedback are welcome! :tada:

I have tried to cater for as many use cases that I can think of.
However, they are naturally tailored to to my own workflow and I could
be missing many others.

Because of this if there is a specific use case that does not work as
you would expect or if you have any suggestions to how the plugin should
behave, feel free to `open an
issue <https://github.com/MichaelAquilina/zsh-filter-history/issues/new>`__

Running Tests
-------------

Install `zunit <https://zunit.xyz/>`__. Run ``zunit`` in the root
directory of the repo.

::

    $ zunit
    Launching ZUnit
    ZUnit: 0.8.2
    ZSH:   zsh 5.6.2 (x86_64-suse-linux-gnu)

    ✔ version exported
    ✔ hooks are loaded by default
    ✔ no excludes
    ✔ excludes correctly
    ✔ excludes correctly - 2

    5 tests run in 135ms

    Results
    ✔ Passed      5
    ✘ Failed      0
    ‼ Errors      0
    ● Skipped     0
    ‼ Warnings    0

NOTE: It is required that you use a minimum zunit version of 0.8.2

.. _Zplug: https://github.com/zplug/zplug

.. _Antigen: https://github.com/zsh-users/antigen

.. _ZGen: https://github.com/tarjoilija/zgen

.. _oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh

.. |GPLv3| image:: https://img.shields.io/badge/License-GPL%20v3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |CircleCI| image:: https://circleci.com/gh/MichaelAquilina/zsh-filter-history.svg?style=svg
   :target: https://circleci.com/gh/MichaelAquilina/zsh-filter-history

.. |Version| image:: https://badge.fury.io/gh/MichaelAquilina%2Fzsh-filter-history.svg
   :target: https://badge.fury.io/gh/MichaelAquilina%2Fzsh-filter-history
