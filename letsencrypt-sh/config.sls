# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt-sh/map.jinja" import letsencrypt_sh with context %}

letsencrypth-sh-config:
  file.managed:
    - name: {{ letsencrypt_sh.config_file }}
    - source: salt://letsencrypt-sh/files/config
    - mode: 644
    - user: root
    - group: root
    - template: jinja

letsencrypt-sh-domains:
  file.managed:
    - name: {{ letsencrypt_sh.domains_txt }}
    - source: salt://letsencrypt-sh/files/domains.txt
    - mode: 644
    - user: root
    - group: root
    - template: jinja
