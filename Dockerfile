FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmariadb-dev yarn
RUN mkdir /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
WORKDIR /app
RUN bundle install

ADD . /app
ENTRYPOINT ["/app/entrypoint.sh"]
