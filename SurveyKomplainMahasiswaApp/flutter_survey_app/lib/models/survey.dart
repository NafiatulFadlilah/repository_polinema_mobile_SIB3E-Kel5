class Survey {
  final int id;
  final String genre;
  final String reports;
  final int age;
  final double gpa;
  final int year;
  final int count;
  final String gender;
  final String nationality;
  final String created_at;
  final String updated_at;

  Survey(
      {required this.id,
      required this.genre,
      required this.reports,
      required this.age,
      required this.gpa,
      required this.year,
      required this.count,
      required this.gender,
      required this.nationality,
      required this.created_at,
      required this.updated_at,
      });

  factory Survey.fromJson(Map<String, dynamic> parsedJson) {
    return Survey(
        id: parsedJson['id'],
        genre: parsedJson['genre'],
        reports: parsedJson['reports'],
        age: parsedJson['age'] * 1,
        gpa: parsedJson['gpa'] * 1.0,
        year: parsedJson['year'] * 1,
        count: parsedJson['count'] * 1,
        gender: parsedJson['gender'],
        nationality: parsedJson['nationality'],
        created_at: parsedJson['created_at'],
        updated_at: parsedJson['updated_at']
      );
  }
}