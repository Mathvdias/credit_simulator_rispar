abstract class IRestClient {
  Future<dynamic> get(String url, {Map<String, dynamic>? queries});

  Future<Map<String, dynamic>> post(String url, dynamic data);

  Future<Map<String, dynamic>> put(String url, dynamic data);
}
