==================
dehydrated-formula
==================

This formula allows you to use the
`dehydrated <https://github.com/lukas2511/dehydrated>` ACME client
to automatically manage TLS certificates issued by the
`letsencrypt.org <https://letsencrypt.org>` service.

Available states
================

.. contents::
    :local:

``dehydrated``
--------------

Installs the dehydrated client, its configuration file, the apache
integration and the cron job.

``dehydrated.install``
----------------------

Installs the dehydrated client.

``dehydrated.config``
---------------------

Installs the dehydrated configuration file. Can also install a hook
script in /etc/dehydrated/hook (overridable with
pillar ``dehydrated:lookup:hook_script``) whose content is taken from
the source file defined at pillar
``dehydrated:lookup:hook_script_src`` (which defaults to a script
reloading the service whose name is set in pillar
``dehydrated:lookup:hook_service_to_reload``).

``dehydrated.apache``
---------------------

Installs the Apache integration allowing dehydrated to validate HTTP
challenges required by letsencrypt.org to issue/renew TLS certificates.

``dehydrated.cron``
-------------------

Enables a periodic task that renews managed TLS certificates that are
about to expire.
