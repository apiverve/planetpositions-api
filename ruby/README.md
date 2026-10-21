# Planet Positions API - Ruby Gem

Planet Positions locates solar system bodies for any observer coordinates on Earth. It checks if the sun, moon, or planets sit below the horizon, while paid plans add celestial coordinates and distance.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_planetpositions'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_planetpositions
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_planetpositions'

# Initialize the client
client = APIVerve::Planetpositions::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  planet: "Moon",
  date: "2025-04-15 10:37:00",
  lat: 37.7749,
  lon: -122.4194,
  alt: 52
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ planet: "Moon", date: "2025-04-15 10:37:00", lat: 37.7749, lon: -122.4194, alt: 52 })
  puts response["data"]
rescue APIVerve::Planetpositions::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Planetpositions::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Planetpositions::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/planetpositions?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/planetpositions?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/planetpositions?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
