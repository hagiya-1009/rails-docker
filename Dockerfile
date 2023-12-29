FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  yarn

WORKDIR /rails-docker

COPY Gemfile Gemfile.lock ./

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]