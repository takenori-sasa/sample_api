FROM ruby:2.7.2

WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get update && apt-get install -y nodejs


COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

COPY heroku.entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
