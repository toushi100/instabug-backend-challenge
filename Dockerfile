FROM ruby:3.2.2
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y cron build-essential default-libmysqlclient-dev git libvips pkg-config
ENV SECRET_KEY_BASE=secret_key_base
ENV RAILS_ENV=production
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /app
