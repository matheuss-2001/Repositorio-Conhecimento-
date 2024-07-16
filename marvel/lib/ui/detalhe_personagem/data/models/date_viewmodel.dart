class DateViewmodel {
  final String type;
  final String date;

  DateViewmodel({
    required this.type,
    required this.date,
  });

  factory DateViewmodel.fromJson(Map<String, dynamic> json) {
    return DateViewmodel(
      type: json['type'] ?? "",
      date: json['date'] ?? "",
    );
  }
}
