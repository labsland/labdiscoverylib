.. _configuration:

Configuration values
====================

The following are the configuration variables of **labdiscoverylib**:

LabDiscoveryEngine
------------------

.. tabularcolumns:: |p{6.5cm}|p{8.5cm}|

================================= =========================================
``WEBLAB_USERNAME``               LabDiscoveryEngine credentials. It is not the
                                  username of the new user: it represents
                                  the system itself (e.g., the LabDiscoveryEngine
                                  system calling). **Mandatory**
``WEBLAB_PASSWORD``               LabDiscoveryEngine credentials. Read also
                                  ``WEBLAB_USERNAME``. **Mandatory**
``WEBLAB_POLL_INTERVAL``          LabDiscoveryEngine is connecting every few seconds
                                  to the laboratory asking if the user is still
                                  alive or if he left. By default, 5 seconds.
                                  You can regulate it with this configuration
                                  variable. Note that if you establish ``0``,
                                  then LabDiscoveryEngine will not ask again and
                                  will wait until the end of the cycle.
================================= =========================================

URLs
----

.. tabularcolumns:: |p{6.5cm}|p{8.5cm}|

================================= =========================================
``WEBLAB_CALLBACK_URL``           **labdiscoverylib** creates a set or URLs for
                                  receiving methods directly by the user.
                                  This methods must be publicly available by
                                  the student. It can be ``/mylab/callback``.
``WEBLAB_BASE_URL``               If you want to start /weblab/sessions
                                  somewhere else (e.g., ``/mylab``), you can
                                  configure it here.
``WEBLAB_SCHEME``                 If set to ``https``, forces using ``https`` in
                                  the link sent to the user.
================================= =========================================

Redis
-----

.. tabularcolumns:: |p{6.5cm}|p{8.5cm}|

================================= =========================================
``WEBLAB_REDIS_URL``              Url used for connecting to Redis. By
                                  default it's the database 0 with localhost
                                  and standard port, but you can configure it:
                                  ``redis://localhost:6379/``.
``WEBLAB_REDIS_BASE``             If you use multiple laboratories in the same
                                  server, you should give different values to
                                  this configuration so there is no conflict
                                  in Redis. If one is ``lab1`` and the other
                                  is ``lab2``, in Redis values will start by
                                  ``lab1:`` or ``lab2:``.
================================= =========================================

Session management
------------------

.. tabularcolumns:: |p{6.5cm}|p{8.5cm}|

================================= =========================================
``WEBLAB_SESSION_ID_NAME``        The name that the **labdiscoverylib** session will
                                  have in the Flask **session** object.
``WEBLAB_TIMEOUT``                Value in seconds taken by **labdiscoverylib** to
                                  consider a user expired if s/he hasn't polled
                                  in this time.
``WEBLAB_AUTOPOLL``               If ``True`` (default value), it will make
                                  that every call to the server will call
                                  ``poll``.
``WEBLAB_EXPIRED_USERS_TIMEOUT``  Once the user is expired, the information is
                                  kept in Redis for some time. By default, this
                                  is ``3600`` (seconds, which is one hour).
``WEBLAB_UNAUTHORIZED_LINK``      When a user is not logged in (or the session
                                  expired -after an hour-, by default finds an
                                  ``Access forbidden`` message. You can put
                                  a link here to redirect him to a different
                                  URL (such as your LabDiscoveryEngine system, so
                                  the student is forced to log in).
``WEBLAB_UNAUTHORIZED_TEMPLATE``  Same as ``WEBLAB_UNAUTHORIZED_LINK``, but
                                  instead of redirecting, it renders a template.
                                  If you put ``forbidden.html``, it will render
                                  whatever is in ``templates/forbidden.html``.
================================= =========================================

Processes and threading
-----------------------

.. tabularcolumns:: |p{6.5cm}|p{8.5cm}|

================================= =========================================
``WEBLAB_AUTOCLEAN_THREAD``       By default ``True``, it states whether there
                                  will be a thread by process cleaning sessions
                                  of expired users or not.
``WEBLAB_TASK_THREADS_PROCESS``   By default ``3``, it is the number of threads
                                  in each **labdiscoverylib** process running tasks
                                  submitted by user.
``WEBLAB_NO_THREAD``              Equivalent to ``WEBLAB_AUTOCLEAN_THREAD=False``
                                  and ``WEBLAB_TASK_THREADS_PROCESS=0``. If you
                                  use it, make sure you run ``flask loop``
================================= =========================================

