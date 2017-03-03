#!/bin/sh
set -e

# create ruby system user
addgroup ruby
adduser -S -G ruby ruby

# configure rubygems to skip documentation
echo -e "install: --no-document --no-rdoc --no-ri" >> /etc/gemrc
echo -e "update: --no-document --no-rdoc --no-ri" >> /etc/gemrc

# install ruby, rubygems, and irb
apk add --no-cache \
  ruby=$RUBY_VERSION \
  ruby-bigdecimal=$RUBY_VERSION \
  ruby-io-console=$RUBY_VERSION \
  ruby-irb=$RUBY_VERSION \
  ruby-json=$RUBY_VERSION \
  ruby-rake=$RUBY_VERSION

# install bundler gem
gem install bundler

# create a ruby app directory
mkdir -p /opt/ruby

# self destruct
rm -- "$0"
