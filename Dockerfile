# syntax = docker/dockerfile:1.4
# Minimal Railway Dockerfile - Version 11.0

FROM ruby:3.2.0-slim

# Set working directory
WORKDIR /app

# Set production environment
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development:test

# Install minimal dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application
COPY . .

# Create user
RUN useradd -m -s /bin/bash rails && \
    chown -R rails:rails /app
USER rails

# Create startup script with detailed logging
RUN echo '#!/bin/bash' > /app/start.sh && \
    echo 'set -e' >> /app/start.sh && \
    echo 'echo "=== Starting Rails application ==="' >> /app/start.sh && \
    echo 'echo "RAILS_ENV: $RAILS_ENV"' >> /app/start.sh && \
    echo 'echo "PORT: $PORT"' >> /app/start.sh && \
    echo 'echo "DATABASE_URL: ${DATABASE_URL:0:50}..."' >> /app/start.sh && \
    echo 'echo "SECRET_KEY_BASE: ${SECRET_KEY_BASE:0:20}..."' >> /app/start.sh && \
    echo 'echo "=== Checking database connection ==="' >> /app/start.sh && \
    echo 'if [ -n "$DATABASE_URL" ]; then' >> /app/start.sh && \
    echo '  echo "Database URL is set"' >> /app/start.sh && \
    echo 'else' >> /app/start.sh && \
    echo '  echo "ERROR: DATABASE_URL is not set"' >> /app/start.sh && \
    echo '  exit 1' >> /app/start.sh && \
    echo 'fi' >> /app/start.sh && \
    echo 'echo "=== Running database migrations ==="' >> /app/start.sh && \
    echo 'bundle exec rails db:migrate' >> /app/start.sh && \
    echo 'echo "=== Starting Rails server ==="' >> /app/start.sh && \
    echo 'PORT=${PORT:-3000}' >> /app/start.sh && \
    echo 'echo "Using port: $PORT"' >> /app/start.sh && \
    echo 'bundle exec rails server -b 0.0.0.0 -p $PORT' >> /app/start.sh && \
    chmod +x /app/start.sh

# Start command
CMD ["/app/start.sh"]
