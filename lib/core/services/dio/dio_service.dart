import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
  final Dio _dio = Dio();
  final String _graphqlUrl;
  final String _apiKey;

  DioService()
    : _graphqlUrl = '${dotenv.env['SUPABASE_URL']}',
      _apiKey = '${dotenv.env['API_KEY']}' {
    _dio.options.baseUrl = _graphqlUrl;
    _dio.options.headers = {
      'Authorization': 'Bearer $_apiKey',
      'apikey': _apiKey,
      'Content-Type': 'application/json',
    };

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> query({
    required String query,
    Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await _dio.post(
        '',
        data: {'query': query, 'variables': variables},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch data: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('GraphQL Query Error: $e');
    }
  }

  Future<void> fetchData() async {
    const String queryData = '''
     query {
        usersCollection {
          edges{
            node{
              id
              name
              email}
            }
          }
        }
    ''';

    try {
      final result = await query(query: queryData);
      print("Result: $result");
    } catch (e) {
      print("Error: $e");
    }
  }
}
