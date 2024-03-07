#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

if ! bundle check ; then
    bundle install --jobs 4
fi

echo "Bundle Vesion"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

bundle -v
nodejs -v

echo "RUM => Migrate "
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

echo "RUM => YARN "
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
yarn install


# (bundle exec rails db:migrate:status | grep "^\s*down") && bin/rails db:create || echo "No create databse."
# (bundle exec rails db:migrate:status | grep "^\s*down") && bundle exec rails db:migrate || echo "No pending migrations found."

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
