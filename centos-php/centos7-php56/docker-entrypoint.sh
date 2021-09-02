#!/usr/bin/env bash

# Fail on unset variables and command errors
set -ue -o pipefail

if [[ ! -e "/entrypoint.inited" ]]; then

  # 初期処理実施
  echo
  for f in /docker-entrypoint-init.d/*; do
    case "$f" in
      *.sh)  echo "$0: running $f"; . "$f" ;;
##      *.sql) echo "$0: running $f"; psql --username postgres --dbname "$POSTGRES_DB" < "$f" && echo ;;
      *)     echo "$0: ignoring $f" ;;
    esac
    echo
  done

  touch "/entrypoint.inited"
fi

exec "$@"
