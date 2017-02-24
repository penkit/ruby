#!/bin/sh
set -e

# create ruby system user
addgroup ruby
adduser -S -G ruby ruby

# configure rubygems to skip documentation
echo -e "install: --no-document\nupdate: --no-document" >> /etc/gemrc \

# install ruby, rubygems, bundler, and irb
apk add --no-cache \
  ruby \
  ruby-bigdecimal \
  ruby-bundler \
  ruby-irb

# create a ruby app directory
mkdir -p /opt/ruby

# self destruct
rm -- "$0"
