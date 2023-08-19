# Generate your site content as HTML
FROM ruby:alpine as bridgetown_builder
ENV BRIDGETOWN_ENV=production
WORKDIR /app
RUN apk add --no-cache build-base
RUN gem install bundler -N
RUN gem install bridgetown -N
COPY . .
RUN bundle install
RUN ./bin/bridgetown deploy

# Serve your site in a tiny production container, which serves on port 8043.
FROM pierrezemb/gostatic
COPY --from=bridgetown_builder /app/output /srv/http/
