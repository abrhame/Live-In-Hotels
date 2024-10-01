const dummy_data = [
  {
    "images": [
      "assets/room1_1.jpg",
      "assets/room1_2.jpg",
      "assets/room1_3.jpg"
    ],
    "name": "Entire Cabin in Lillehammer",
    "rating": {"score": 4.9, "reviews": 150},
    "type": "Entire home hosted by Emma",
    "amenities": [
      "WiFi",
      "TV",
      "Indoor fireplace",
      "Hair dryer",
      "Washing machine",
      "Dryer",
      "Refrigerator",
      "Dishwasher"
    ],
    "checkin": {
      "type": "Self Check-in",
      "details": "Check yourself in with the keypad."
    },
    "experience": {
      "description": "Great check-in experience!",
      "details":
          "100% of recent guests gave the check-in process a 5-star rating."
    },
    "price": {
      "amount": 120,
      "currency": "EUR",
      "availability": {"from": "2024-10-18", "to": "2024-10-21", "nights": 3}
    }
  },
  {
    "images": [
      "assets/room2_1.jpg",
      "assets/room2_2.jpg",
      "assets/room2_3.jpg"
    ],
    "name": "Charming Studio in Oslo",
    "rating": {"score": 4.7, "reviews": 85},
    "type": "Entire home hosted by Lars",
    "amenities": ["WiFi", "TV", "Coffee maker", "Hair dryer", "Refrigerator"],
    "checkin": {
      "type": "Self Check-in",
      "details": "Use the smart lock for easy access."
    },
    "experience": {
      "description": "Smooth and easy check-in process.",
      "details": "95% of guests rated check-in as excellent."
    },
    "price": {
      "amount": 90,
      "currency": "EUR",
      "availability": {"from": "2024-10-15", "to": "2024-10-20", "nights": 5}
    }
  },
  {
    "images": [
      "assets/room3_1.jpg",
      "assets/room3_2.jpg",
      "assets/room3_3.jpg"
    ],
    "name": "Luxury Apartment in Bergen",
    "rating": {"score": 4.8, "reviews": 200},
    "type": "Entire home hosted by Sofie",
    "amenities": [
      "WiFi",
      "TV",
      "Indoor fireplace",
      "Hair dryer",
      "Washing machine",
      "Dishwasher",
      "Hot tub"
    ],
    "checkin": {
      "type": "Self Check-in",
      "details": "Enter using a code provided before arrival."
    },
    "experience": {
      "description": "Exceptional check-in experience.",
      "details": "98% of guests rated the check-in process as 5-star."
    },
    "price": {
      "amount": 150,
      "currency": "EUR",
      "availability": {"from": "2024-11-01", "to": "2024-11-05", "nights": 4}
    }
  },
  {
    "images": [
      "assets/room4_1.jpg",
      "assets/room4_2.jpg",
      "assets/room4_3.jpg"
    ],
    "name": "Cozy Cottage in Tromsø",
    "rating": {"score": 4.6, "reviews": 60},
    "type": "Entire home hosted by Jonas",
    "amenities": ["WiFi", "TV", "Fireplace", "Refrigerator", "Free parking"],
    "checkin": {
      "type": "Self Check-in",
      "details": "Access the keys from the lockbox."
    },
    "experience": {
      "description": "Wonderful check-in experience.",
      "details": "92% of guests rated their check-in as fantastic."
    },
    "price": {
      "amount": 110,
      "currency": "EUR",
      "availability": {"from": "2024-09-28", "to": "2024-10-01", "nights": 3}
    }
  },
  {
    "images": [
      "assets/room5_1.jpg",
      "assets/room5_2.jpg",
      "assets/room5_3.jpg"
    ],
    "name": "Modern Loft in Stavanger",
    "rating": {"score": 4.5, "reviews": 120},
    "type": "Entire home hosted by Mia",
    "amenities": ["WiFi", "TV", "Hair dryer", "Dishwasher", "Washing machine"],
    "checkin": {
      "type": "Self Check-in",
      "details": "Check-in with a unique access code."
    },
    "experience": {
      "description": "Very good check-in process.",
      "details": "89% of guests rated check-in as 5-star."
    },
    "price": {
      "amount": 130,
      "currency": "EUR",
      "availability": {"from": "2024-10-10", "to": "2024-10-15", "nights": 5}
    }
  }
];

class Room {
  final List<String> imageUrls; // List of image URLs for the room
  final String name;
  final double rating;
  final int reviewCount; // Number of reviews
  final String hostedBy;
  final String roomType;
  final String hostImage;
  final List<String> amenities;
  final String checkInType;
  final String checkInDetails;
  final String experience;
  final String experienceDetails;
  final double price;
  final String availability;
  final int numberOfNights; // Number of nights for booking

  Room({
    required this.imageUrls,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.hostedBy,
    required this.roomType,
    required this.hostImage,
    required this.amenities,
    required this.checkInType,
    required this.checkInDetails,
    required this.experience,
    required this.experienceDetails,
    required this.price,
    required this.availability,
    required this.numberOfNights,
  });
}

List<Room> dummyRooms = [
  Room(
    imageUrls: [
      'assets/discover_top.jpg',
      'assets/discover_top.jpg',
      'assets/discover_top.jpg',
    ], // List of image URLs for the room
    name: 'Entire Cabin in Lillehammer',
    rating: 4.8,
    reviewCount: 150, // Number of reviews
    hostedBy: 'Hosted by Anna',
    roomType: 'Entire home', // Type of room
    amenities: [
      'WiFi',
      'TV',
      'Indoor fireplace',
      'Hair dryer',
      'Washing machine',
      'Dryer',
      'Refrigerator',
      'Dishwasher',
    ],
    checkInType: 'Self Check-in',
    hostImage: 'assets/discover_top.jpg',
    checkInDetails: 'Check yourself in with a lockbox.',
    experience: 'Great check-in experience',
    experienceDetails:
        '100% of recent guests give the check-in process a 5-star rating.',
    price: 120.0,
    availability: '18 - 21 Oct',
    numberOfNights: 3,
  ),
  Room(
    imageUrls: [
      'assets/discover_top.jpg',
      'assets/discover_top.jpg',
      'assets/discover_top.jpg',
    ], // List of image URLs for the second room
    name: 'Charming Apartment in Oslo',
    rating: 4.5,
    reviewCount: 100, // Number of reviews
    hostedBy: 'Hosted by John',
    roomType: 'Private room', // Type of room
    hostImage: 'assets/discover_top.jpg',
    amenities: [
      'WiFi',
      'Air conditioning',
      'Kitchen',
      'TV',
      'Parking',
    ],
    checkInType: 'Self Check-in',
    checkInDetails: 'Use the smart lock for entry.',
    experience: 'Smooth check-in experience',
    experienceDetails: 'Most guests found it easy to check in.',
    price: 150.0,
    availability: '15 - 20 Nov',
    numberOfNights: 5,
  ),
  Room(
    imageUrls: [
      'assets/discover_top.jpg',
      'assets/discover_top.jpg',
      'assets/discover_top.jpg',
    ], // List of image URLs for the third room
    name: 'Luxurious Villa in Bergen',
    rating: 4.9,
    reviewCount: 75, // Number of reviews
    hostedBy: 'Hosted by Lisa',
    roomType: 'Entire home', // Type of room
    hostImage: 'assets/discover_top.jpg',
    amenities: [
      'WiFi',
      'Pool',
      'Gym',
      'Spa',
      'Kitchen',
    ],
    checkInType: 'Self Check-in',
    checkInDetails: 'Enjoy the villa at your own pace.',
    experience: 'Exceptional stay experience',
    experienceDetails: 'Guests rated their stay highly.',
    price: 300.0,
    availability: '1 - 7 Dec',
    numberOfNights: 6,
  ),
  // Add more rooms as needed
];

// Model for message
class Message {
  final String senderProfileImage;
  final String senderName;
  final String content;
  final bool isCurrentUser;

  Message({
    required this.senderProfileImage,
    required this.senderName,
    required this.content,
    required this.isCurrentUser,
  });
}

// Example message list
List<Message> dummy_messages = [
  Message(
      senderProfileImage: 'assets/discover_top.jpg',
      senderName: 'User1',
      content: 'Hello!',
      isCurrentUser: false),
  Message(
      senderProfileImage: 'assets/discover_top.jpg',
      senderName: 'User2',
      content: 'Hi there!',
      isCurrentUser: true),
  // Add more messages here
];
