import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class PlanetpositionsValidationException implements Exception {
  final List<String> errors;

  PlanetpositionsValidationException(this.errors);

  @override
  String toString() => 'PlanetpositionsValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Planet Positions API client.
///
/// For more information, visit: https://apiverve.com/marketplace/planetpositions?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [date] - The date to get planetary position data for (MM-DD-YYYY) [format: date]
/// * [time] - The time of day for the calculation (HH:mm format, 24-hour), read as UTC unless timezone is given. Defaults to 00:00 if not provided [format: time]
/// * [timezone] - IANA timezone to read the date and time in, such as America/Los_Angeles. Defaults to UTC [format: timezone]
/// * [lat] (required) - The latitude of the observer [min: -90, max: 90]
/// * [lon] (required) - The longitude of the observer [min: -180, max: 180]
/// * [alt] - The altitude of the observer in meters [min: 0]
/// * [planet] (required) - The planet to get position data for
class PlanetpositionsClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'date': ValidationRule(type: 'string', required: false, format: 'date'),
    'time': ValidationRule(type: 'string', required: false, format: 'time'),
    'timezone': ValidationRule(type: 'string', required: false, format: 'timezone'),
    'lat': ValidationRule(type: 'number', required: true, min: -90, max: 90),
    'lon': ValidationRule(type: 'number', required: true, min: -180, max: 180),
    'alt': ValidationRule(type: 'number', required: false, min: 0),
    'planet': ValidationRule(type: 'string', required: true),
  };

  PlanetpositionsClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/planetpositions',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [PlanetpositionsValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw PlanetpositionsValidationException(errors);
    }
  }

  /// Execute a request to the Planet Positions API.
  ///
  /// Parameters are validated before sending the request.
  Future<PlanetpositionsResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw PlanetpositionsException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final response = await _httpClient.post(
        Uri.parse(baseUrl),
        headers: {
          'x-api-key': apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return PlanetpositionsResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw PlanetpositionsException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw PlanetpositionsException('Resource not found');
      } else {
        throw PlanetpositionsException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is PlanetpositionsException) rethrow;
      throw PlanetpositionsException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Planet Positions API client.
class PlanetpositionsException implements Exception {
  final String message;

  PlanetpositionsException(this.message);

  @override
  String toString() => 'PlanetpositionsException: $message';
}
