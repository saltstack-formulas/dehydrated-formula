# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dehydrated/map.jinja" import dehydrated with context %}

{% set install_hook = False %}
{% if dehydrated.hook_script_src != 'salt://dehydrated/files/hook' or dehydrated.hook_service_to_reload %}
{% set install_hook = True %}
{% endif %}

dehydrated-config:
  file.managed:
    - name: {{ dehydrated.config_file }}
    - source: salt://dehydrated/files/config
    - mode: 644
    - user: root
    - template: jinja
    - context:
        use_default_hook: {{ install_hook }}

{% if install_hook %}
dehydrated-hook:
  file.managed:
    - name: {{ dehydrated.hook_script }}
    - source: {{ dehydrated.hook_script_src }}
    - mode: 755
    - user: root
    - template: jinja
{% endif %}

dehydrated-domains:
  file.managed:
    - name: {{ dehydrated.domains_txt }}
    - source: salt://dehydrated/files/domains.txt
    - mode: 644
    - user: root
    - template: jinja
