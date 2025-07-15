# syntax = docker/dockerfile:1.4
# Simple Railway Dockerfile - Version 7.0

FROM ruby:3.2.0-slim

# Set working directory
WORKDIR /app

# Set production environment
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development:test

# Install system dependencies (minimal)
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

# Copy application code
COPY . .

# Precompile assets (skip if fails)
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile || echo "Asset precompilation failed, continuing..."

# Create non-root user
RUN useradd -m -s /bin/bash rails && \
    chown -R rails:rails /app
USER rails

# Set entrypoint
ENTRYPOINT ["/app/bin/docker-entrypoint"]

# Expose port
EXPOSE 3000

# Start command - Railway compatible
CMD ["sh", "-c", "bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}"]
