class Grade {
  final int id;
  final String nim;
  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s7;
  final double s8;
  final String created_at;
  final String updated_at;

  Grade({
    required this.id,
    required this.nim, 
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s7,
    required this.s8,
    required this.created_at,
    required this.updated_at,
  });

  factory Grade.fromJson(Map<String, dynamic> parsedJson) {
    return Grade(
        id: parsedJson['id'],
        nim: parsedJson['nim'],
        s1: parsedJson['s1'] as double,
        s2: parsedJson['s2'] as double,
        s3: parsedJson['s3'] as double,
        s4: parsedJson['s4'] as double,
        s5: parsedJson['s5'] as double,
        s6: parsedJson['s6'] as double,
        s7: parsedJson['s7'] as double,
        s8: parsedJson['s8'] as double,
        created_at: parsedJson['created_at'],
        updated_at: parsedJson['updated_at'], 
      );
  }
}