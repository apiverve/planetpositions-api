# Planet Positions API - PHP Package

Planet Positions locates solar system bodies for any observer coordinates on Earth. It checks if the sun, moon, or planets sit below the horizon, while paid plans add celestial coordinates and distance.

## Installation

Install via Composer:

```bash
composer require apiverve/planetpositions
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Planetpositions\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'planet' => 'Moon',
    'date' => '2025-04-15 10:37:00',
    'lat' => 37.7749,
    'lon' => -122.4194,
    'alt' => 52
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Planetpositions\Client;
use APIVerve\Planetpositions\Exceptions\APIException;
use APIVerve\Planetpositions\Exceptions\ValidationException;

try {
    $response = $client->execute(['planet' => 'Moon', 'date' => '2025-04-15 10:37:00', 'lat' => 37.7749, 'lon' => -122.4194, 'alt' => 52]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "planet": "Moon",
    "isBelowHorizon": false,
    "date": "2025-04-15T10:37:00Z",
    "observer": {
      "latitude": 37.7749,
      "longitude": -122.4194
    },
    "rightAscension": {
      "hours": 15,
      "minutes": 13,
      "seconds": 11
    },
    "declination": {
      "degrees": -23,
      "minutes": 10,
      "seconds": 56
    },
    "distance": {
      "km": 402457.36,
      "lightTravelSeconds": 1.342,
      "astronomicalUnits": 0.003
    },
    "siderealTime": {
      "hours": 16,
      "minutes": 2,
      "seconds": 42
    },
    "hourAngle": {
      "hours": 0,
      "minutes": 49,
      "seconds": 31
    },
    "vectors": {
      "x": -0.0016452947779903913,
      "y": -0.0018463324771434563,
      "z": -0.0010590407236111441
    }
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/planetpositions?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/planetpositions?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/planetpositions?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
