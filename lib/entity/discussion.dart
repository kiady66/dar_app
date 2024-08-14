class Discussion {
  final String title;
  final String id;
  final String currentUserID;
  final String otherUserID;
  final DateTime timestamp;
  final String lastMessage;

  Discussion({
    required this.title,
    required this.id,
    required this.currentUserID,
    required this.otherUserID,
    required this.timestamp,
    required this.lastMessage,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) {
    return Discussion(
      title: json['title'],
      id: json['id'],
      currentUserID: json['currentUserID'],
      otherUserID: json['otherUserID'],
      timestamp: DateTime.parse(json['timestamp']),
      lastMessage: json['lastMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'currentUserID': currentUserID,
      'otherUserID': otherUserID,
      'timestamp': timestamp.toIso8601String(),
      'lastMessage': lastMessage,
    };
  }
}