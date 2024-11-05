// lib/core/error/exceptions.dart
class ServerException implements Exception {}

// lib/core/error/exceptions.dart
class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}


