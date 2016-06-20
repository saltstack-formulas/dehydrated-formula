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

Installs the letsencrypt.sh configuration file.

``letsencrypt-sh.apache``
-------------------------

Installs the Apache integration allowing letsencrypt.sh to validate HTTP
challenges required by letsencrypt.org to issue/renew TLS certificates.

``letsencrypt-sh.cron``
-----------------------

Enables a periodic task that renews managed TLS certificates that are
about to expire.
