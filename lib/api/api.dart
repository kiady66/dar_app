

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../entity/discussion.dart';
import '../entity/message.dart';

const String apiEndpoint = 'http://192.168.0.50:3000';


List<Message> getMessages(currentUserID, otherUserID, int page, int pageSize) {
  List<Message> messages = [];
  for (var i = 0; i < mockMessageListJson['messages']!.length; i++) {
    var message = mockMessageListJson['messages']![i];
    if ((message['senderID'] == currentUserID && message['receiverID'] == otherUserID) ||
        (message['senderID'] == otherUserID && message['receiverID'] == currentUserID)) {
      messages.add(Message.fromJson(message));
    }
  }
  return messages;
}

Future<List<Discussion>> getDiscussion({int page = 1, int pageSize = 10}) async {

  const String path = '$apiEndpoint/discussions-list';

  try {
    final response = await http.get(Uri.parse('$path?page=$page&pageSize=$pageSize'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> pageDiscussionsJson = responseData['discussions'];

      final discussions = pageDiscussionsJson.map((json) => Discussion.fromJson(json as Map<String, dynamic>)).toList();
      return discussions;
    } else {
      throw Exception('Failed to load discussions');
    }
  } catch (e) {
    throw Exception('Failed to load discussions');
  }

}

Future<User?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn(
    scopes: [
      'email',
    ],
  ).signIn();
  if (googleUser == null) {
    // If the user cancels the sign-in process
    return null;
  }

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  return userCredential.user;
}


const mockMessageListJson = {
  "messages": [
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "Hello",
      "timestamp": "2021-10-10T12:00:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "Hi",
      "timestamp": "2021-10-10T12:01:00Z"
    },
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "How are you?",
      "timestamp": "2021-10-10T12:02:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "I'm good",
      "timestamp": "2021-10-10T12:03:00Z"
    },
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "That's good to hear",
      "timestamp": "2021-10-10T12:04:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "How about you?",
      "timestamp": "2021-10-10T12:05:00Z"
    },
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "I'm doing well",
      "timestamp": "2021-10-10T12:06:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "That's great",
      "timestamp": "2021-10-10T12:07:00Z"
    },
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "What are you up to?",
      "timestamp": "2021-10-10T12:08:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "Just relaxing",
      "timestamp": "2021-10-10T12:09:00Z"
    },
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "Sounds nice",
      "timestamp": "2021-10-10T12:10:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "Yeah",
      "timestamp": "2021-10-10T12:11:00Z"
    },
    {
      "senderID": "1",
      "receiverID": "2",
      "message": "I have to go now",
      "timestamp": "2021-10-10T12:12:00Z"
    },
    {
      "senderID": "2",
      "receiverID": "1",
      "message": "Okay, talk to you later",
      "timestamp": "2021-10-10T12:13:00Z"
    }
  ]
};



