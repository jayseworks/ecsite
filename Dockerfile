FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libsqlite3-dev \
  sqlite3 \
  nodejs \
  npm && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json package-lock.json ./
RUN npm install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bash"]
