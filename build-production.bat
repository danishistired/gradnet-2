@echo off
echo Building GradNet for production...

echo Installing dependencies...
call npm install

echo Building frontend...
call npm run build

echo.
echo Build complete! 
echo.
echo To test production build locally:
echo   Set NODE_ENV=production
echo   Set JWT_SECRET=your-secret-key
echo   Run: npm start
echo.
echo The app will serve the built frontend from the backend server.
echo Visit: http://localhost:5000
pause