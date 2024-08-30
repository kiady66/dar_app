import 'location.dart';

class Profile {
  final String userID;
  final String username;
  final String email;
  final List<String>? photos; // Nullable list of URLs for profile pictures
  final String? bio;
  final DateTime? dateOfBirth;
  final bool? gender;
  final String? sexualOrientation;
  final List<String>? interests;
  final Location? location; // Nullable Location object
  final String? occupation;
  final int? height; // Nullable height
  final String? educationLevel;
  final DateTime createdAt; // Assume createdAt is always required

  Profile({
    required this.userID,
    required this.username,
    required this.email,
    this.photos,
    this.bio,
    this.dateOfBirth,
    this.gender,
    this.sexualOrientation,
    this.interests,
    this.location,
    this.occupation,
    this.height,
    this.educationLevel,
    required this.createdAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userID: json['userID'],
      username: json['username'],
      email: json['email'],
      photos: json['photos'] != null ? List<String>.from(json['photos']) : null,
      bio: json['bio'],
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      gender: json['gender'],
      sexualOrientation: json['sexualOrientation'],
      interests: json['interests'] != null ? List<String>.from(json['interests']) : null,
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
      occupation: json['occupation'],
      height: json['height'],
      educationLevel: json['educationLevel'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'username': username,
      'email': email,
      'photos': photos, // Can be null
      'bio': bio,
      'dateOfBirth': dateOfBirth?.toIso8601String(), // Can be null
      'gender': gender,
      'sexualOrientation': sexualOrientation,
      'interests': interests, // Can be null
      'location': location?.toJson(), // Can be null
      'occupation': occupation,
      'height': height,
      'educationLevel': educationLevel,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
