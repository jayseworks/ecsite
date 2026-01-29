FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  sqlite3 \
  libsqlite3-dev \
  nodejs \
  npm

WORKDIR /app

# Ruby deps
COPY Gemfile Gemfile.lock ./
RUN bundle install

# JS deps
COPY package.json package-lock.json ./
RUN npm install

# App
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bash"]
