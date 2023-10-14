class Student {
  String name;
  int roll;
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
      name: json['name'],
      roll: json['roll'],
      branch: json['branch'],
      email: json['email'],
      phone: json['phone'],
      batch: json['batch'],
      favouriteSport: json['favouriteSport'],
    );
  }
}
