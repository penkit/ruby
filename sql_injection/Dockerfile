FROM penkit/ruby:latest

RUN apk add --no-cache mariadb-dev build-base ruby-dev

# Install gems
COPY Gemfile* /opt/ruby/
RUN bundle install
COPY . /opt/ruby/

# Start server
EXPOSE 8080
CMD ["rackup", "-o", "0.0.0.0", "-p", "8080"]