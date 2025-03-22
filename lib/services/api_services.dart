import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Add a delay for demo purposes to better see loading states
  Future<List<Post>> fetchPosts() async {
    try {
      // Simulate network delay (for demo purposes)
      await Future.delayed(const Duration(milliseconds: 800));

      final response = await http.get(Uri.parse('$baseUrl/posts'));

      // Randomly throw an error occasionally (for testing error handling)
      if (Random().nextInt(10) == 0) {
        throw Exception('Simulated random network error for testing');
      }

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
