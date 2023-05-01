FROM ruby:2.7.2

ENV LANG C.UTF-8
# 必要なのをインストール
RUN apt-get update -qq && apt-get install -y nodejs
# # nodeとyarnをインストール
# RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#     echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
# set -x && apt-get update -y -qq && \
# apt-get install -yq nodejs yarn && \
# curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
# apt-get install -y nodejs
RUN bundle config set force_ruby_platform true
RUN mkdir /app
WORKDIR /app
COPY . /app
# PORT設定
EXPOSE 3000

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
