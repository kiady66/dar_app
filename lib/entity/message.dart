class Message {
  final String senderID;
  final String receiverID;
  final String message;
  final DateTime timestamp;
  final String discussionID;

  Message({
    required this.senderID,
    required this.receiverID,
    required this.message,
    required this.timestamp,
    required this.discussionID,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderID: json['senderID'],
      receiverID: json['receiverID'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
      discussionID: json['discussionID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'discussionID': discussionID,
    };
  }
}