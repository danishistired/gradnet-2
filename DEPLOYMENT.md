# GradNet - Render Deployment Guide

## Quick Deployment to Render

This project is configured for deployment on Render using the included `render.yaml` file.

### Prerequisites
- A Render account (https://render.com)
- Your code pushed to a GitHub repository

### Deployment Steps

1. **Connect Repository to Render**
   - Go to your Render dashboard
   - Click "New" and select "Blueprint"
   - Connect your GitHub repository
   - Render will automatically detect the `render.yaml` file

2. **Environment Variables**
   The following environment variables will be automatically configured:
   - `NODE_ENV=production`
   - `JWT_SECRET` (auto-generated)
   - `FRONTEND_URL` (auto-linked from frontend service)
   - `VITE_API_URL` (auto-linked from backend service)

3. **Services Created**
   - **Backend API**: Node.js web service running your Express server
   - **Frontend**: Static site serving your React app

### Manual Deployment (Alternative)

If you prefer manual deployment:

1. **Backend Service**:
   - Service Type: Web Service
   - Environment: Node
   - Build Command: `cd backend && npm install`
   - Start Command: `cd backend && npm start`

2. **Frontend Service**:
   - Service Type: Static Site
   - Build Command: `npm install && npm run build`
   - Publish Directory: `./dist`

### Environment Variables to Set Manually

If deploying manually, set these in your Render service settings:

**Backend Service:**
```
NODE_ENV=production
JWT_SECRET=your-secure-jwt-secret-here
FRONTEND_URL=https://your-frontend-service-name.onrender.com
```

**Frontend Service:**
```
NODE_ENV=production
VITE_API_URL=https://your-backend-service-name.onrender.com
```

### Local Development

For local development:
```bash
# Install dependencies
npm install

# Run development mode (both frontend and backend)
npm run dev

# Or run separately:
npm run client  # Frontend only
npm run server  # Backend only
```

### Production Build

To test production build locally:
```bash
npm run build
npm start
```

### Database

Currently using file-based JSON storage. The database file will be created automatically on first run.

**Note**: For production, consider migrating to a proper database service offered by Render (PostgreSQL, Redis, etc.)

### Troubleshooting

- **CORS Issues**: Make sure your frontend URL is correctly set in the backend CORS configuration
- **API Endpoints**: Verify that all frontend API calls use the configured `VITE_API_URL`
- **Build Failures**: Check that all dependencies are properly listed in package.json
- **Static File Serving**: The backend serves the frontend in production mode automatically

### URLs After Deployment

- Frontend: `https://gradnet-frontend.onrender.com`
- Backend API: `https://gradnet-backend.onrender.com/api`

(URLs will be different based on your service names)