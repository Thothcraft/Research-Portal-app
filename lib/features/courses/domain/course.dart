/// Course model for research training courses

class Course {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final String duration;
  final String level; // Beginner, Intermediate, Advanced
  final int enrolledCount;
  final double rating;
  final List<String> topics;
  final String thumbnailUrl;
  final bool isEnrolled;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.duration,
    required this.level,
    required this.enrolledCount,
    required this.rating,
    required this.topics,
    required this.thumbnailUrl,
    this.isEnrolled = false,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      instructor: json['instructor'] as String,
      duration: json['duration'] as String,
      level: json['level'] as String,
      enrolledCount: json['enrolled_count'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
      isEnrolled: json['is_enrolled'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'instructor': instructor,
      'duration': duration,
      'level': level,
      'enrolled_count': enrolledCount,
      'rating': rating,
      'topics': topics,
      'thumbnail_url': thumbnailUrl,
      'is_enrolled': isEnrolled,
    };
  }

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? instructor,
    String? duration,
    String? level,
    int? enrolledCount,
    double? rating,
    List<String>? topics,
    String? thumbnailUrl,
    bool? isEnrolled,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      instructor: instructor ?? this.instructor,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      enrolledCount: enrolledCount ?? this.enrolledCount,
      rating: rating ?? this.rating,
      topics: topics ?? this.topics,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      isEnrolled: isEnrolled ?? this.isEnrolled,
    );
  }
}
