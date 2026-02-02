FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libsqlite3-dev \
  sqlite3 \
  nodejs \
  npm

WORKDIR /app

RUN gem install bundler

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
