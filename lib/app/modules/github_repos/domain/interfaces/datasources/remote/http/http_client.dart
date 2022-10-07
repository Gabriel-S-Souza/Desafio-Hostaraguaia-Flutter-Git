abstract class HttpClient {
  Future get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
}
