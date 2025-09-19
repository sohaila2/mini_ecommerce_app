class ApiConstants {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String products = "/products";
  static const String categories = "/products/categories";
}

class ApiErrors {
  static const String badRequestError = "Bad request error";
  static const String noContent = "No content available";
  static const String forbiddenError = "Forbidden request";
  static const String unauthorizedError = "Unauthorized request";
  static const String notFoundError = "Not found";
  static const String conflictError = "Conflict error";
  static const String internalServerError = "Internal server error";
  static const String unknownError = "Unknown error occurred";
  static const String timeoutError = "Request timeout";
  static const String defaultError = "Unexpected error occurred";
  static const String cacheError = "Cache error";
  static const String noInternetError = "No internet connection";
  static const String requestCancelled = "Request cancelled";
}
