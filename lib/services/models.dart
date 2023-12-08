List<String> sportsList = [
  'Cricket',
  'Football',
  'Basketball',
  'Volleyball',
  'Badminton',
  'Tennis',
  'Table Tennis',
  'Hockey',
  'Chess',
];

Map<String, String> sportsImages = {
  'Cricket': 'cricket.jpg',
  'Football': 'football.jpg',
  'Basketball': 'basketball.jpg',
  'Volleyball': 'volleyball.jpg',
  'Badminton': 'badminton.jpg',
  'Tennis': 'tennis.jpg',
  'Table Tennis': 'tabletennis.jpg',
  'Hockey': 'hockey.jpg',
  'Chess': 'chess.jpg',
};

class Student {
  String name;
  String roll;
  String branch;
  String email;
  String phone;
  String batch;
  String favouriteSport;
  List registeredEvents = [];
  List fines = [];

  Student({
    required this.name,
    required this.roll,
    required this.branch,
    required this.email,
    required this.phone,
    required this.batch,
    required this.favouriteSport,
    this.registeredEvents = const [],
    this.fines = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'roll': roll,
      'branch': branch,
      'email': email,
      'phone': phone,
      'batch': batch,
      'favouriteSport': favouriteSport,
      'registeredEvents': registeredEvents,
      'fines': fines,
    };
  }

  static Student fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] ?? json['Name'],
      roll: json['roll'] ?? json['Roll'],
      branch: json['branch'] ?? json['Branch'],
      email: json['email'] ?? json['Email'],
      phone: json['phone'] ?? json['Phone'],
      batch: json['batch'] ?? json['Batch'],
      favouriteSport: json['favouriteSport'] ?? json['Favourite Sport'],
      registeredEvents: json['registeredEvents'] ?? json['Registered Events'] ?? [],
      fines: json['fines'] ?? json['Fines'] ?? [],
    );
  }
}

class Event {
  String id;
  String name;
  DateTime date;
  String location;
  String sport;
  String description;
  List participants = [];

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.sport,
    required this.description,
    this.participants = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'location': location,
      'sport': sport,
      'description': description,
      'participants': participants,
    };
  }

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? json['Id'] ?? '',
      name: json['name'] ?? json['Name'],
      date: json['date'] ?? json['Date'] ?? DateTime.fromMicrosecondsSinceEpoch(json['date'].microsecondsSinceEpoch),
      location: json['location'] ?? json['Location'],
      sport: json['sport'] ?? json['Sport'],
      description: json['description'] ?? json['Description'],
      participants: json['participants'] ?? json['Participants'] ?? [],
    );
  }
}


class SG {
  final String name;
  final String mentor;
  final String credits;
  final String startdate;
  final String status;
  final String description;
  final String fees;
  final String img;
  final String registrationCap;

  SG({
    this.name = '',
    this.mentor = '',
    this.credits = '',
    this.startdate = '',
    this.description = '',
    this.fees = '',
    this.img = '',
    this.status = '',
    this.registrationCap = '',
  });
}