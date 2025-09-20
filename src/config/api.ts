// API Configuration
const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export const config = {
  apiBaseUrl: API_BASE_URL,
  apiUrl: `${API_BASE_URL}/api`,
};

export default config;