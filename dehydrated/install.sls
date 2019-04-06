# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dehydrated/map.jinja" import dehydrated with context %}

dehydrated-pkg:
  pkg.installed:
    - name: {{ dehydrated.pkg }}

dehydrated-group:
  group.present:
    - name: {{ dehydrated.group }}
    - system: True

dehydrated-user:
  user.present:
    - name: {{ dehydrated.user }}
    - gid: {{ dehydrated.group }}
    - createhome: False
    - system: True
