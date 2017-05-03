FROM ruby:2.4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install --jobs 20 --retry 5
