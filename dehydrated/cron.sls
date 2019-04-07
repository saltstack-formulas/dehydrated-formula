# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "dehydrated/map.jinja" import dehydrated with context %}

{% if dehydrated.cron_enabled %}
dehydrated-cron:
  cron.present:
    - name: {{ dehydrated.cron_command }}
    - user: {{ dehydrated.user }}
    - identifier: dehydrated-cron
    - minute: {{ dehydrated.cron_minute }}
    - hour: {{ dehydrated.cron_hour }}
    - dayweek: {{ dehydrated.cron_dayweek }}
    - comment: Renew TLS certificates with letsencrypt.org
{% else %}
disable-dehydrated-cron:
  cron.absent:
    - user: {{ dehydrated.user }}
    - identifier: dehydrated-cron
{% endif %}
