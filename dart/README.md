# Planet Positions API - Dart/Flutter Client

Planet Positions locates solar system bodies for any observer coordinates on Earth. It checks if the sun, moon, or planets sit below the horizon, while paid plans add celestial coordinates and distance.

[![pub package](https://img.shields.io/pub/v/apiverve_planetpositions.svg)](https://pub.dev/packages/apiverve_planetpositions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Planet Positions API](https://apiverve.com/marketplace/planetpositions?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_planetpositions: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_planetpositions/apiverve_planetpositions.dart';

void main() async {
  final client = PlanetpositionsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'planet': 'Moon',
      'date': '2025-04-15 10:37:00',
      'lat': 37.7749,
      'lon': -122.4194,
      'alt': 52
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Planet Positions API](https://apiverve.com/marketplace/planetpositions?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/planetpositions](https://docs.apiverve.com/ref/planetpositions?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
