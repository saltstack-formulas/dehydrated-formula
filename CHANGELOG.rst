letsencrypt-sh formula
======================

0.2.0 (2016-08-23)

- Updated for version 0.2.0 of the client. Forces BASEDIR and DOMAINS_TXT
  to values used by the formula in case the local configuration (or the
  defaults) differs from the expected value. Also use
  /etc/letsencrypt.sh/config.sh on non-Debian systems as this
  is the canonical configuration file and we can't assume that
  /etc/letsencrypt.sh/conf.d is in use.

0.1.0 (2016-06-21)

- Initial version, compatible with version 0.1.0 of the client
  (tested with version 0.1.0-3~bpo8+1 of the Debian package).
