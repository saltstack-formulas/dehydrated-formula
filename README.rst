======================
letsencrypt-sh-formula
======================

This formula allows you to use the
`letsencrypt.sh <https://github.com/lukas2511/letsencrypt.sh>` client
to automatically manage TLS certificates issued by the
`letsencrypt.org <https://letsencrypt.org>` service.

Available states
================

.. contents::
    :local:

``letsencrypt-sh``
------------------

Installs the letsencrypt.sh client, its configuration file, the apache
integration and the cron job.

``letsencrypt-sh.install``
--------------------------

Installs the letsencrypt.sh client.

``letsencrypt-sh.config``
-------------------------

Installs the letsencrypt.sh configuration file. Can also install a hook
script in /etc/letsencrypt.sh/hook (overridable with
pillar ``letsencrypt-sh:lookup:hook_script``) whose content is taken from
the source file defined at pillar
``letsencrypt-sh:lookup:hook_script_src`` (which defaults to a script
reloading the service whose name is set in pillar
``letsencrypt-sh:lookup:hook_service_to_reload``).

``letsencrypt-sh.apache``
-------------------------

Installs the Apache integration allowing letsencrypt.sh to validate HTTP
challenges required by letsencrypt.org to issue/renew TLS certificates.

``letsencrypt-sh.cron``
-----------------------

Enables a periodic task that renews managed TLS certificates that are
about to expire.
