#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails-app/tmp/pids/server.pid
RAILS_ENV=production bundle exec rails assets:clean assets:precompile
exec "$@"
