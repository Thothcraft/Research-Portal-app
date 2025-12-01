/// Community post model

class CommunityPost {
  final String id;
  final String authorName;
  final String authorRole;
  final String content;
  final DateTime timestamp;
  final int likesCount;
  final int commentsCount;
  final List<String> tags;
  final bool isLiked;

  const CommunityPost({
    required this.id,
    required this.authorName,
    required this.authorRole,
    required this.content,
    required this.timestamp,
    required this.likesCount,
    required this.commentsCount,
    required this.tags,
    this.isLiked = false,
  });

  factory CommunityPost.fromJson(Map<String, dynamic> json) {
    return CommunityPost(
      id: json['id'] as String,
      authorName: json['author_name'] as String,
      authorRole: json['author_role'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      likesCount: json['likes_count'] as int? ?? 0,
      commentsCount: json['comments_count'] as int? ?? 0,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isLiked: json['is_liked'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author_name': authorName,
      'author_role': authorRole,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'likes_count': likesCount,
      'comments_count': commentsCount,
      'tags': tags,
      'is_liked': isLiked,
    };
  }

  CommunityPost copyWith({
    String? id,
    String? authorName,
    String? authorRole,
    String? content,
    DateTime? timestamp,
    int? likesCount,
    int? commentsCount,
    List<String>? tags,
    bool? isLiked,
  }) {
    return CommunityPost(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
      authorRole: authorRole ?? this.authorRole,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      tags: tags ?? this.tags,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
