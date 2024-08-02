class Message {
  final String senderID;
  final String receiverID;
  final String message;
  final DateTime timestamp;

  Message({
    required this.senderID,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderID: json['senderID'],
      receiverID: json['receiverID'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}