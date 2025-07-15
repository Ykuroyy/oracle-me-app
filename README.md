# Oracle Me App

A Rails application for Oracle card readings with a beautiful UI built with Tailwind CSS.

## Railway Deployment

This app is configured for deployment on Railway.

### Prerequisites

- Railway account
- Git repository

### Deployment Steps

1. **Connect to Railway**
   - Go to [Railway](https://railway.app)
   - Create a new project
   - Connect your GitHub repository

2. **Configure Environment Variables**
   In Railway dashboard, add these environment variables:
   ```
   RAILS_ENV=production
   RAILS_SERVE_STATIC_FILES=true
   RAILS_LOG_TO_STDOUT=true
   SECRET_KEY_BASE=<generate a secure key>
   ```

3. **Database Setup**
   - Railway will automatically provision a PostgreSQL database
   - The `DATABASE_URL` will be automatically set by Railway

4. **Deploy**
   - Railway will automatically build and deploy your app using the Dockerfile
   - The app will be available at the provided Railway URL

### Local Development

```bash
# Install dependencies
bundle install

# Setup database
rails db:create
rails db:migrate
rails db:seed

# Start the server
rails server
```

### Features

- Oracle card readings with beautiful animations
- Responsive design with Tailwind CSS
- PostgreSQL database
- Docker containerization
