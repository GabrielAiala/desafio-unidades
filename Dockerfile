FROM ruby:3.1.4

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs
RUN mkdir /unidades
WORKDIR /unidades
ADD Gemfile /unidades/Gemfile
ADD Gemfile.lock /unidades/Gemfile.lock
RUN bundle install
ADD . /unidades