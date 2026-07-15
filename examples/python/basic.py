"""
Planet Positions API - Basic Usage Example

This example demonstrates the basic usage of the Planet Positions API.
API Documentation: https://docs.apiverve.com/ref/planetpositions
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/planetpositions'

def call_planetpositions_api():
    """
    Make a POST request to the Planet Positions API
    """
    try:
        # Request body
        request_body &#x3D; {
    &#x27;planet&#x27;: &#x27;Moon&#x27;,
    &#x27;date&#x27;: &#x27;2025-04-15 10:37:00&#x27;,
    &#x27;lat&#x27;: 37.7749,
    &#x27;lon&#x27;: -122.4194,
    &#x27;alt&#x27;: 52
}

        headers = {
            'x-api-key': API_KEY,
            'Content-Type': 'application/json'
        }

        response = requests.post(API_URL, headers=headers, json=request_body)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Planet Positions API...\n')

    result = call_planetpositions_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
