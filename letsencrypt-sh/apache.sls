# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt-sh/map.jinja" import letsencrypt_sh with context %}

letsencrypt-sh-pkg-apache:
  pkg.installed:
    - name: {{ letsencrypt_sh.pkg_apache }}
