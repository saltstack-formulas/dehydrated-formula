# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dehydrated/map.jinja" import dehydrated with context %}

dehydrated-pkg:
  pkg.installed:
    - name: {{ dehydrated.pkg }}
