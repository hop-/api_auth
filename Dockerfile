FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]