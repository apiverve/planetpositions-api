/**
 * Basic Example - Planet Positions API
 *
 * This example demonstrates how to use the Planet Positions API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const planetpositionsAPI = require('../index.js');

// Initialize the API client
const api = new planetpositionsAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  "planet": "Moon",
  "date": "2025-04-15 10:37:00",
  "lat": 37.7749,
  "lon": -122.4194,
  "alt": 52
};

// Make the API request using callback
console.log('Making request to Planet Positions API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
