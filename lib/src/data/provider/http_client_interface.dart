abstract class IRestClient {
  Future<Map<String, dynamic>> post(String url, dynamic data);
}
