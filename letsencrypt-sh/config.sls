# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt-sh/map.jinja" import letsencrypt_sh with context %}

{% set install_hook = False %}
{% if letsencrypt_sh.hook_script_src != 'salt://letsencrypt-sh/files/hook' or letsencrypt_sh.hook_service_to_reload %}
{% set install_hook = True %}
{% endif %}

letsencrypt-sh-config:
  file.managed:
    - name: {{ letsencrypt_sh.config_file }}
    - source: salt://letsencrypt-sh/files/config
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - context:
        use_default_hook: {{ install_hook }}

{% if install_hook %}
letsencrypt-sh-hook:
  file.managed:
    - name: {{ letsencrypt_sh.hook_script }}
    - source: {{ letsencrypt_sh.hook_script_src }}
    - mode: 755
    - user: root
    - group: root
    - template: jinja
{% endif %}

letsencrypt-sh-domains:
  file.managed:
    - name: {{ letsencrypt_sh.domains_txt }}
    - source: salt://letsencrypt-sh/files/domains.txt
    - mode: 644
    - user: root
    - group: root
    - template: jinja
