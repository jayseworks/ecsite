#!/bin/bash
set -e

# server.pid が残っていると起動できない問題を防ぐ
rm -f /app/tmp/pids/server.pid

exec "$@"
