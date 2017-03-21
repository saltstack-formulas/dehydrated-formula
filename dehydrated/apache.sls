# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dehydrated/map.jinja" import dehydrated with context %}

dehydrated-pkg-apache:
  pkg.installed:
    - name: {{ dehydrated.pkg_apache }}
