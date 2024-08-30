import 'package:dar_app/entity/profile.dart';

class Session {
  final Profile profile;
  final DateTime loginTime;
  final String authToken;
  final List<DateTime> sessionHistory = [];

  // Constructor with default values for loginTime and authToken
  Session({
    required this.profile,
    DateTime? loginTime, // Optional parameter
    String? authToken,   // Optional parameter
  })  : loginTime = loginTime ?? DateTime.now(), // Default to current time
        authToken = authToken ?? generateDefaultAuthToken(); // Default to generated token

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      profile: Profile.fromJson(json['profile']),
      loginTime: DateTime.parse(json['loginTime']),
      authToken: json['authToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'loginTime': loginTime.toIso8601String(),
      'authToken': authToken,
      'sessionHistory': sessionHistory.map((time) => time.toIso8601String()).toList(),
    };
  }

  // Helper method to generate a default auth token
  static String generateDefaultAuthToken() {
    // Implement a secure token generation method as needed
    return 'default-token-${DateTime.now().millisecondsSinceEpoch}';
  }
}