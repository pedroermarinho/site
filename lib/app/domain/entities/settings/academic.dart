class Academic {
  Academic({
    required this.institution,
    required this.course,
    required this.startDate,
    required this.type,
    this.endDate,
  });

  late final String institution;
  late final String course;
  late final String startDate;
  late final String? endDate;
  late final String type;

  Academic.fromJson(Map<String, dynamic> json) {
    institution = json['institution'];
    course = json['course'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['institution'] = institution;
    _data['course'] = course;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['type'] = type;
    return _data;
  }
}
