class DateProposition {
  final String description;
  final double price;
  final String iconUrl;
  final String senderID;
  final String recipientID;

  DateProposition({
    required this.description,
    required this.price,
    required this.iconUrl,
    required this.senderID,
    required this.recipientID,
  });

  factory DateProposition.fromJson(Map<String, dynamic> json) {
    return DateProposition(
      description: json['description'],
      price: json['price'],
      iconUrl: json['iconUrl'],
      senderID: json['senderID'],
      recipientID: json['recipientID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'price': price,
      'iconUrl': iconUrl,
      'senderID': senderID,
      'recipientID': recipientID,
    };
  }
}
