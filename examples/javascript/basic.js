/**
 * Planet Positions API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Planet Positions API.
 * API Documentation: https://docs.apiverve.com/ref/planetpositions
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/planetpositions';

/**
 * Make a POST request to the Planet Positions API
 */
async function callPlanetPositionsAPI() {
  try {
    // Request body
    const requestBody &#x3D; {
    &quot;planet&quot;: &quot;Moon&quot;,
    &quot;date&quot;: &quot;2025-04-15 10:37:00&quot;,
    &quot;lat&quot;: 37.7749,
    &quot;lon&quot;: -122.4194,
    &quot;alt&quot;: 52
};

    const response = await fetch(API_URL, {
      method: 'POST',
      headers: {
        'x-api-key': API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestBody)
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callPlanetPositionsAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
