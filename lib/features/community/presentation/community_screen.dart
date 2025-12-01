/// Community screen showing research community discussions and posts

import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildNewPostButton(context),
          const SizedBox(height: 16),
          _buildPostCard(
            context,
            authorName: 'Dr. Sarah Johnson',
            authorRole: 'Research Lead',
            content:
                'Just published our latest findings on IoT sensor optimization. The results show a 40% improvement in energy efficiency! Check out the paper in the resources section.',
            timestamp: '2 hours ago',
            likesCount: 24,
            commentsCount: 8,
            tags: ['IoT', 'Research', 'Energy Efficiency'],
          ),
          const SizedBox(height: 16),
          _buildPostCard(
            context,
            authorName: 'Prof. Michael Chen',
            authorRole: 'ML Specialist',
            content:
                'Looking for collaborators on a federated learning project. We\'re exploring distributed model training across IoT devices. DM if interested!',
            timestamp: '5 hours ago',
            likesCount: 31,
            commentsCount: 12,
            tags: ['Machine Learning', 'Collaboration', 'Federated Learning'],
          ),
          const SizedBox(height: 16),
          _buildPostCard(
            context,
            authorName: 'Emily Rodriguez',
            authorRole: 'Graduate Student',
            content:
                'Question for the community: What are the best practices for handling sensor data in real-time? Our current setup is experiencing latency issues.',
            timestamp: '1 day ago',
            likesCount: 18,
            commentsCount: 23,
            tags: ['Question', 'Real-time Data', 'Best Practices'],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showNewPostDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('New Post'),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Research Community',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Connect, share, and collaborate with fellow researchers',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildNewPostButton(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _showNewPostDialog(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                'Share your research updates...',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard(
    BuildContext context, {
    required String authorName,
    required String authorRole,
    required String content,
    required String timestamp,
    required int likesCount,
    required int commentsCount,
    required List<String> tags,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Author info
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    authorName[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        authorRole,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  timestamp,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Content
            Text(content),
            const SizedBox(height: 12),

            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),

            // Actions
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up_outlined, size: 18),
                  label: Text('$likesCount'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[700],
                  ),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined, size: 18),
                  label: Text('$commentsCount'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[700],
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.share_outlined, size: 18),
                  onPressed: () {},
                  color: Colors.grey[700],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showNewPostDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Post'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Share your research updates...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post created successfully')),
              );
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}
