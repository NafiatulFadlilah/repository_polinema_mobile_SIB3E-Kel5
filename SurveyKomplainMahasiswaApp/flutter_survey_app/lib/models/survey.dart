class Survey {
  late int id;
  late String genre;
  late String reports;
  late int age;
  late double gpa;
  late int year;
  late int count;
  late String gender;
  late String nationality;

  Survey(this.id, this.genre, this.reports, this.age, this.gpa, this.year, this.count, this.gender, this.nationality);

  Survey.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson['id'];
    this.genre = parsedJson['genre'];
    this.reports = parsedJson['reports'];
    this.age = parsedJson['age'] * 1;
    this.gpa = parsedJson['gpa'] * 1.0;
    this.year = parsedJson['year'] * 1;
    this.count = parsedJson['count'] * 1;
    this.gender = parsedJson['gender'];
    this.nationality = parsedJson['nationality'];
  }
}