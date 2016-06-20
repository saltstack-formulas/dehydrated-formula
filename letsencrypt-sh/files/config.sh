{% set cfg_client = salt['pillar.get']('letsencrypt-sh:config', {}) -%}
{%- macro get_config(configname, default_value) -%}
{%- set varname = configname.replace("-", "_") -%}
{%- if configname in cfg_client -%}
{{ varname|upper }}="{{ cfg_client[configname] }}"
{%- else -%}
#{{ varname|upper }}="{{ default_value }}"
{%- endif -%}
{%- endmacro -%}
# This file is managed by Salt, do not edit by hand!
# Based on letsencrypt.sh version 0.1.0 default config

########################################################
# This is the main config file for letsencrypt.sh      #
#                                                      #
# Default values of this config are in comments        #
########################################################

# Path to certificate authority (default: https://acme-v01.api.letsencrypt.org/directory)
{{ get_config('ca', 'https://acme-v01.api.letsencrypt.org/directory') }}

# Path to license agreement (default: https://letsencrypt.org/documents/LE-SA-v1.0.1-July-27-2015.pdf)
{{ get_config('license', 'https://letsencrypt.org/documents/LE-SA-v1.0.1-July-27-2015.pdf') }}

# Which challenge should be used? Currently http-01 and dns-01 are supported
{{ get_config('challengetype', 'http-01') }}

# Base directory for account key, generated certificates and list of domains (default: $SCRIPTDIR -- uses config directory if undefined)
{{ get_config('basedir', '/var/lib/letsencrypt.sh') }}

# Output directory for challenge-tokens to be served by webserver or deployed in HOOK (default: $BASEDIR/.acme-challenges)
{{ get_config('wellknown', '/var/lib/letsencrypt.sh/acme-challenges') }}

# Location of private account key (default: $BASEDIR/private_key.pem)
{{ get_config('private-key', '${BASEDIR}/private_key.pem') }}

# Location of private account registration information (default: $BASEDIR/private_key.json)
{{ get_config('private-key-json', '${BASEDIR}/private_key.json') }}

# Default keysize for private keys (default: 4096)
{{ get_config('keysize', '4096') }}

# Path to openssl config file (default: <unset> - tries to figure out system default)
{{ get_config('openssl_cnf', '') }}

# Program or function called in certain situations
#
# After generating the challenge-response, or after failed challenge (in this case altname is empty)
# Given arguments: clean_challenge|deploy_challenge altname token-filename token-content
#
# After successfully signing certificate
# Given arguments: deploy_cert domain path/to/privkey.pem path/to/cert.pem path/to/fullchain.pem
#
# BASEDIR and WELLKNOWN variables are exported and can be used in an external program
# default: <unset>
{{ get_config('hook', '') }}

# Chain clean_challenge|deploy_challenge arguments together into one hook call per certificate (default: no)
{{ get_config('hook-chain', 'no') }}

# Minimum days before expiration to automatically renew certificate (default: 30)
{{ get_config('renew-days', '30') }}

# Regenerate private keys instead of just signing new certificates on renewal (default: no)
{{ get_config('private-key-renew', 'no') }}

# Which public key algorithm should be used? Supported: rsa, prime256v1 and secp384r1
{{ get_config('key-algo', 'rsa') }}

# E-mail to use during the registration (default: <unset>)
{{ get_config('contact-email', '') }}

# Lockfile location, to prevent concurrent access (default: $BASEDIR/lock)
{{ get_config('lockfile', '${BASEDIR}/lock') }}
