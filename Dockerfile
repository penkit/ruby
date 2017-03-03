FROM penkit/alpine:latest

# run as non-root user
ENV RUN_AS ruby

# default to ruby app directory
WORKDIR /opt/ruby

# execute interactive ruby terminal by default
CMD ["irb"]

# set ruby version from build arguments
ARG RUBY_VERSION
ENV RUBY_VERSION ${RUBY_VERSION}

# run setup script to install ruby
COPY ruby-setup.sh /usr/local/sbin/
RUN ruby-setup.sh
