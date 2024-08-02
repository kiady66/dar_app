

import 'discussion.dart';
import 'message.dart';

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

List<Discussion> getDiscussion(int page, int pageSize) {
  final discussionsJson = mockDiscussionListJson['discussions'] as List<dynamic>;

  // Calculate the start and end index based on the page and pageSize
  final startIndex = (page - 1) * pageSize;
  final endIndex = startIndex + pageSize;

  // Ensure the end index does not exceed the length of the list
  final limitedEndIndex = endIndex > discussionsJson.length ? discussionsJson.length : endIndex;

  // Get the subset of discussions for the requested page
  final pageDiscussionsJson = discussionsJson.sublist(startIndex, limitedEndIndex);

  // Convert the subset of JSON to a list of Discussion objects
  final discussions = pageDiscussionsJson.map((json) => Discussion.fromJson(json as Map<String, dynamic>)).toList();

  return discussions;
}

const mockDiscussionListJson = {
  "discussions": [
    {
      "id": "1",
      "title": "Discussion 1",
      "currentUserID": "1",
      "otherUserID": "2",
      "timestamp": "2021-10-10T12:00:00Z",
      "lastMessage": "Hello, how are you?"
    },
    {
      "id": "2",
      "title": "Discussion 2",
      "currentUserID": "1",
      "otherUserID": "3",
      "timestamp": "2021-10-10T12:01:00Z",
      "lastMessage": "Can we schedule a meeting?"
    },
    {
      "id": "3",
      "title": "Discussion 3",
      "currentUserID": "2",
      "otherUserID": "3",
      "timestamp": "2021-10-10T12:02:00Z",
      "lastMessage": "Sure, what time works for you?"
    },
    {
      "id": "4",
      "title": "Discussion 4",
      "currentUserID": "2",
      "otherUserID": "4",
      "timestamp": "2021-10-10T12:03:00Z",
      "lastMessage": "Let's catch up soon."
    },
    {
      "id": "5",
      "title": "Discussion 5",
      "currentUserID": "3",
      "otherUserID": "4",
      "timestamp": "2021-10-10T12:04:00Z",
      "lastMessage": "I have some updates for you."
    },
    {
      "id": "6",
      "title": "Discussion 6",
      "currentUserID": "3",
      "otherUserID": "5",
      "timestamp": "2021-10-10T12:05:00Z",
      "lastMessage": "Did you finish the report?"
    },
    {
      "id": "7",
      "title": "Discussion 7",
      "currentUserID": "4",
      "otherUserID": "5",
      "timestamp": "2021-10-10T12:06:00Z",
      "lastMessage": "Meeting at 3 PM tomorrow?"
    },
    {
      "id": "8",
      "title": "Discussion 8",
      "currentUserID": "4",
      "otherUserID": "6",
      "timestamp": "2021-10-10T12:07:00Z",
      "lastMessage": "I'll be there."
    },
    {
      "id": "9",
      "title": "Discussion 9",
      "currentUserID": "5",
      "otherUserID": "6",
      "timestamp": "2021-10-10T12:08:00Z",
      "lastMessage": "Can you send the files?"
    },
    {
      "id": "10",
      "title": "Discussion 10",
      "currentUserID": "5",
      "otherUserID": "7",
      "timestamp": "2021-10-10T12:09:00Z",
      "lastMessage": "Let's discuss this in detail."
    },
    {
      "id": "11",
      "title": "Discussion 11",
      "currentUserID": "6",
      "otherUserID": "7",
      "timestamp": "2021-10-10T12:10:00Z",
      "lastMessage": "Where are we on the project?"
    },
    {
      "id": "12",
      "title": "Discussion 12",
      "currentUserID": "6",
      "otherUserID": "8",
      "timestamp": "2021-10-10T12:11:00Z",
      "lastMessage": "The deadline is approaching."
    },
    {
      "id": "13",
      "title": "Discussion 13",
      "currentUserID": "7",
      "otherUserID": "8",
      "timestamp": "2021-10-10T12:12:00Z",
      "lastMessage": "I need your feedback."
    },
    {
      "id": "14",
      "title": "Discussion 14",
      "currentUserID": "7",
      "otherUserID": "9",
      "timestamp": "2021-10-10T12:13:00Z",
      "lastMessage": "Let's plan a strategy."
    },
    {
      "id": "15",
      "title": "Discussion 15",
      "currentUserID": "8",
      "otherUserID": "9",
      "timestamp": "2021-10-10T12:14:00Z",
      "lastMessage": "Got your message, will review it."
    },
    {
      "id": "16",
      "title": "Discussion 16",
      "currentUserID": "8",
      "otherUserID": "10",
      "timestamp": "2021-10-10T12:15:00Z",
      "lastMessage": "Thank you for the update."
    },
    {
      "id": "17",
      "title": "Discussion 17",
      "currentUserID": "9",
      "otherUserID": "10",
      "timestamp": "2021-10-10T12:16:00Z",
      "lastMessage": "Looking forward to our meeting."
    },
    {
      "id": "18",
      "title": "Discussion 18",
      "currentUserID": "9",
      "otherUserID": "11",
      "timestamp": "2021-10-10T12:17:00Z",
      "lastMessage": "Can we discuss this further?"
    },
    {
      "id": "19",
      "title": "Discussion 19",
      "currentUserID": "10",
      "otherUserID": "11",
      "timestamp": "2021-10-10T12:18:00Z",
      "lastMessage": "I’ll send the details shortly."
    },
    {
      "id": "20",
      "title": "Discussion 20",
      "currentUserID": "10",
      "otherUserID": "12",
      "timestamp": "2021-10-10T12:19:00Z",
      "lastMessage": "Thanks for your help!"
    },
    {
      "id": "21",
      "title": "Discussion 21",
      "currentUserID": "11",
      "otherUserID": "12",
      "timestamp": "2021-10-10T12:20:00Z",
      "lastMessage": "Can you review the document?"
    },
    {
      "id": "22",
      "title": "Discussion 22",
      "currentUserID": "12",
      "otherUserID": "13",
      "timestamp": "2021-10-10T12:21:00Z",
      "lastMessage": "What are the next steps?"
    },
    {
      "id": "23",
      "title": "Discussion 23",
      "currentUserID": "13",
      "otherUserID": "14",
      "timestamp": "2021-10-10T12:22:00Z",
      "lastMessage": "I'll get back to you by tomorrow."
    },
    {
      "id": "24",
      "title": "Discussion 24",
      "currentUserID": "14",
      "otherUserID": "15",
      "timestamp": "2021-10-10T12:23:00Z",
      "lastMessage": "Let's finalize the details."
    },
    {
      "id": "25",
      "title": "Discussion 25",
      "currentUserID": "15",
      "otherUserID": "16",
      "timestamp": "2021-10-10T12:24:00Z",
      "lastMessage": "Received your proposal, thanks."
    },
    {
      "id": "26",
      "title": "Discussion 26",
      "currentUserID": "16",
      "otherUserID": "17",
      "timestamp": "2021-10-10T12:25:00Z",
      "lastMessage": "Can we have a call to discuss?"
    },
    {
      "id": "27",
      "title": "Discussion 27",
      "currentUserID": "17",
      "otherUserID": "18",
      "timestamp": "2021-10-10T12:26:00Z",
      "lastMessage": "What time works for you?"
    },
    {
      "id": "28",
      "title": "Discussion 28",
      "currentUserID": "18",
      "otherUserID": "19",
      "timestamp": "2021-10-10T12:27:00Z",
      "lastMessage": "Let's meet next week."
    },
    {
      "id": "29",
      "title": "Discussion 29",
      "currentUserID": "19",
      "otherUserID": "20",
      "timestamp": "2021-10-10T12:28:00Z",
      "lastMessage": "I'll confirm the time soon."
    },
    {
      "id": "30",
      "title": "Discussion 30",
      "currentUserID": "20",
      "otherUserID": "21",
      "timestamp": "2021-10-10T12:29:00Z",
      "lastMessage": "Looking forward to the meeting."
    },
    {
      "id": "31",
      "title": "Discussion 31",
      "currentUserID": "21",
      "otherUserID": "22",
      "timestamp": "2021-10-10T12:30:00Z",
      "lastMessage": "Can you provide more details?"
    },
    {
      "id": "32",
      "title": "Discussion 32",
      "currentUserID": "22",
      "otherUserID": "23",
      "timestamp": "2021-10-10T12:31:00Z",
      "lastMessage": "Sure, I'll send the info."
    },
    {
      "id": "33",
      "title": "Discussion 33",
      "currentUserID": "23",
      "otherUserID": "24",
      "timestamp": "2021-10-10T12:32:00Z",
      "lastMessage": "Received, thanks!"
    },
    {
      "id": "34",
      "title": "Discussion 34",
      "currentUserID": "24",
      "otherUserID": "25",
      "timestamp": "2021-10-10T12:33:00Z",
      "lastMessage": "Let's review the plan."
    },
    {
      "id": "35",
      "title": "Discussion 35",
      "currentUserID": "25",
      "otherUserID": "26",
      "timestamp": "2021-10-10T12:34:00Z",
      "lastMessage": "Got it, I'll prepare the slides."
    },
    {
      "id": "36",
      "title": "Discussion 36",
      "currentUserID": "26",
      "otherUserID": "27",
      "timestamp": "2021-10-10T12:35:00Z",
      "lastMessage": "Can we add more details?"
    },
    {
      "id": "37",
      "title": "Discussion 37",
      "currentUserID": "27",
      "otherUserID": "28",
      "timestamp": "2021-10-10T12:36:00Z",
      "lastMessage": "Sure, I'll update it."
    },
    {
      "id": "38",
      "title": "Discussion 38",
      "currentUserID": "28",
      "otherUserID": "29",
      "timestamp": "2021-10-10T12:37:00Z",
      "lastMessage": "Please review the new version."
    },
    {
      "id": "39",
      "title": "Discussion 39",
      "currentUserID": "29",
      "otherUserID": "30",
      "timestamp": "2021-10-10T12:38:00Z",
      "lastMessage": "Everything looks good."
    },
    {
      "id": "40",
      "title": "Discussion 40",
      "currentUserID": "30",
      "otherUserID": "31",
      "timestamp": "2021-10-10T12:39:00Z",
      "lastMessage": "Thanks for your help!"
    }
  ]
};


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



