# Build frontend JS and CSS assets using ESbuild
FROM node:alpine as asset_builder
ENV BRIDGETOWN_ENV=production
WORKDIR /assets
COPY . .
RUN yarn install
RUN yarn run esbuild

# Generate your site content as HTML
FROM ruby:alpine as bridgetown_builder
ENV BRIDGETOWN_ENV=production
WORKDIR /app
RUN apk add --no-cache build-base
RUN gem install bundler -N
RUN gem install bridgetown -N
COPY . .
RUN bundle install
COPY --from=asset_builder /assets/output output/
COPY --from=asset_builder /assets/.bridgetown-cache .bridgetown-cache/
RUN ./bin/bridgetown build

# Serve your site in a tiny production container, which serves on port 8043.
FROM pierrezemb/gostatic
COPY --from=bridgetown_builder /app/output /srv/http/
