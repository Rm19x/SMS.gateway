FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y build-essential
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["ruby", "App.rb"]