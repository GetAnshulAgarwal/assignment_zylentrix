import 'package:flutter/material.dart';
import '../models/post.dart';
import 'post_item.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No posts available',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        )
        : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            // Add section headers for every 10 posts
            if (index % 10 == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index > 0) const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      'Posts ${index + 1} - ${index + 10 > posts.length ? posts.length : index + 10}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.indigo[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PostItem(post: posts[index], index: index),
                ],
              );
            }
            return PostItem(post: posts[index], index: index);
          },
        );
  }
}
