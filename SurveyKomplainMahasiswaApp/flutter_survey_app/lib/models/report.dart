class Report {
  final int id;
  final String nim;
  final String type;
  final String chronology;
  final String evidence;
  final String created_at;
  final String updated_at;

  Report(
      {required this.id,
      required this.nim,
      required this.type,
      required this.chronology,
      required this.evidence,
      required this.created_at,
      required this.updated_at,
      });

  factory Report.fromJson(Map<String, dynamic> parsedJson) {
    return Report(
        id: parsedJson['id'],
        nim: parsedJson['nim'],
        type: parsedJson['type'],
        chronology: parsedJson['chronology'],
        evidence: parsedJson['nationality'],
        created_at: parsedJson['created_at'],
        updated_at: parsedJson['updated_at']
      );
  }
}