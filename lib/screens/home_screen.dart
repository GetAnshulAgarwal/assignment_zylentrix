import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_services.dart';
import '../widgets/post_list.dart';
import '../widgets/error_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Post>> _postsFuture;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() {
      _postsFuture = _apiService.fetchPosts();
    });
  }

  Future<void> _refreshPosts() async {
    setState(() {
      _isRefreshing = true;
    });

    await _fetchPosts();

    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.api, size: 24),
            SizedBox(width: 8),
            Text('Zylentrix Post'),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshPosts,
        child: FutureBuilder<List<Post>>(
          future: _postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                !_isRefreshing) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      'Loading posts...',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return ErrorDisplay(
                errorMessage: snapshot.error.toString(),
                onRetry: _fetchPosts,
              );
            } else if (snapshot.hasData) {
              return PostList(posts: snapshot.data!);
            } else {
              return const Center(child: Text('No posts found'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshPosts,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
