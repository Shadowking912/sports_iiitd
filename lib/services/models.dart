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

class Student {
  String name;
  String roll;
  String branch;
  String email;
  String phone;
  String batch;
  String favouriteSport;

  Student({
    required this.name,
    required this.roll,
    required this.branch,
    required this.email,
    required this.phone,
    required this.batch,
    required this.favouriteSport,
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

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.sport,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'location': location,
      'sport': sport,
      'description': description,
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
    );
  }
}
