# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "letsencrypt-sh/map.jinja" import letsencrypt_sh with context %}

{% if letsencrypt_sh.cron_enabled %}
letsencrypt-sh-cron:
  cron.present:
    - name: {{ letsencrypt_sh.cron_command }}
    - user: root
    - identifier: letsencrypt-sh-cron
    - minute: {{ letsencrypt_sh.cron_minute }}
    - hour: {{ letsencrypt_sh.cron_hour }}
    - dayweek: {{ letsencrypt_sh.cron_dayweek }}
    - comment: Renew TLS certificates with letsencrypt.org
{% else %}
disable-letsencrypt-sh-cron:
  cron.absent:
    - user: root
    - identifier: letsencrypt-sh-cron
{% endif %}
