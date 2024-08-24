#!/bin/bash

# export env variables again so they are not mandatory in docker-compose.yml in a backward compatible manner
export NUM_WORKERS_DEFAULT=${NUM_WORKERS_DEFAULT:-${WORKERS:-5}}
export NUM_WORKERS_PRIO=${NUM_WORKERS_PRIO:-${WORKERS:-5}}
export NUM_WORKERS_EMAIL=${NUM_WORKERS_EMAIL:-${WORKERS:-5}}
export NUM_WORKERS_UPDATE=${NUM_WORKERS_UPDATE:-${WORKERS:-1}}
export NUM_WORKERS_CACHE=${NUM_WORKERS_CACHE:-${WORKERS:-5}}

export MYSQL_HOST=${MYSQL_HOST:-db}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-misp}
export MYSQL_PASSWORD=${MYSQL_PASSWORD:-example}
export MYSQL_DATABASE=${MYSQL_DATABASE:-misp}
export REDIS_HOST=${REDIS_HOST:-redis}
export REDIS_PORT=${REDIS_PORT:-6379}
export REDIS_PASSWORD=${REDIS_PASSWORD:-redispassword}
export CRON_USER_ID=${CRON_USER_ID:-1}
export BASE_URL=${BASE_URL:-https://localhost}
export DISABLE_IPV6=${DISABLE_IPV6:-false}
export DISABLE_SSL_REDIRECT=${DISABLE_SSL_REDIRECT:-false}
export SMTP_FQDN=${SMTP_FQDN:-mail}

export ADMIN_EMAIL=${ADMIN_EMAIL:-admin@admin.test}
export GPG_PASSPHRASE=${GPG_PASSPHRASE:-passphrase}
export MISP_MODULES_FQDN=${MISP_MODULES_FQDN:-http://misp-modules}

export AUTOCONF_GPG=${AUTOCONF_GPG:-true}
export AUTOCONF_ADMIN_KEY=${AUTOCONF_ADMIN_KEY:-true}
export OIDC_ENABLE=${OIDC_ENABLE:-false}
export LDAP_ENABLE=${LDAP_ENABLE:-false}
export ENABLE_DB_SETTINGS=${ENABLE_DB_SETTINGS:-false}
export PROXY_ENABLE=${PROXY_ENABLE:-false}
export DEBUG=${DEBUG:-0}

export FASTCGI_READ_TIMEOUT=${FASTCGI_READ_TIMEOUT:-300s}
export FASTCGI_SEND_TIMEOUT=${FASTCGI_SEND_TIMEOUT:-300s}
export FASTCGI_CONNECT_TIMEOUT=${FASTCGI_CONNECT_TIMEOUT:-300s}

export PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT:-2048M}
export PHP_MAX_EXECUTION_TIME=${PHP_MAX_EXECUTION_TIME:-300}
export PHP_UPLOAD_MAX_FILESIZE=${PHP_UPLOAD_MAX_FILESIZE:-50M}
export PHP_POST_MAX_SIZE=${PHP_POST_MAX_SIZE:-50M}
export PHP_MAX_INPUT_TIME:${PHP_MAX_INPUT_TIME:-300}

# start supervisord using the main configuration file so we have a socket interface
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
