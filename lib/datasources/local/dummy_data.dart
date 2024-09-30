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
  final String imageUrl;
  final String name;
  final double rating;
  final int reviews;
  final String hostedBy;
  final List<String> amenities;
  final String checkInType;
  final String checkInDetails;
  final String experience;
  final String experienceDetails;
  final double price;
  final String availability;
  final int numberOfNights;

  Room({
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.hostedBy,
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
    imageUrl: 'assets/discover_top.jpg',
    name: 'Entire Cabin in Lillehammer',
    rating: 4.8,
    reviews: 150,
    hostedBy: 'Hosted by Anna',
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
    checkInDetails: 'Check yourself in with a lockbox.',
    experience: 'Great check-in experience',
    experienceDetails:
        '100% of recent guests give the check-in process a 5-star rating.',
    price: 120.0,
    availability: '18 - 21 Oct',
    numberOfNights: 3,
  ),

  Room(
    imageUrl: 'assets/discover_top.jpg',
    name: 'Entire Cabin in Lillehammer',
    rating: 4.8,
    reviews: 150,
    hostedBy: 'Hosted by Anna',
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
    checkInDetails: 'Check yourself in with a lockbox.',
    experience: 'Great check-in experience',
    experienceDetails:
        '100% of recent guests give the check-in process a 5-star rating.',
    price: 120.0,
    availability: '18 - 21 Oct',
    numberOfNights: 3,
  ),
  // Add more rooms as needed
];
