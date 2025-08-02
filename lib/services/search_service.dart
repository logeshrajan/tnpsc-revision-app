import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchService {
  static const String _searchEndpoint = 'YOUR_SEARCH_ENDPOINT';
  static const String _apiKey = 'YOUR_SEARCH_API_KEY';
  static const String _indexName = 'textbook-index';

  final http.Client _client = http.Client();

  Future<List<Map<String, dynamic>>> searchContent({
    required String query,
    int top = 10,
  }) async {
    try {
      final url = Uri.parse(
        '$_searchEndpoint/indexes/$_indexName/docs/search?api-version=2023-11-01'
      );
      
      final response = await _client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'api-key': _apiKey,
        },
        body: json.encode({
          'search': query,
          'top': top,
          'highlight': 'content',
          'select': 'id,title,content,metadata_storage_name',
        }),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['value']);
      } else {
        throw Exception('Search failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching content: $e');
    }
  }

  Future<Map<String, dynamic>> getDocumentById(String documentId) async {
    try {
      final url = Uri.parse(
        '$_searchEndpoint/indexes/$_indexName/docs/$documentId?api-version=2023-11-01'
      );
      
      final response = await _client.get(
        url,
        headers: {
          'api-key': _apiKey,
        },
      );
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Document fetch failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching document: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
