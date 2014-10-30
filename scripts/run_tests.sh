#!/bin/sh

cd ruby
ruby --version
bundle install --quiet
bundle exec rspec

RUBY_RESULT=$?

cd ../scala
gradle -q test

GRADLE_RESULT=$?

cd ..

exit `expr $RUBY_RESULT + $GRADLE_RESULT`
