class Phone {
  Phone({
    required this.countryCode,
    required this.areaCode,
    required this.number,
  });

  late final String countryCode;
  late final String areaCode;
  late final String number;

  Phone.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    areaCode = json['areaCode'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countryCode'] = countryCode;
    _data['areaCode'] = areaCode;
    _data['number'] = number;
    return _data;
  }

  String get fullNumber => '+$countryCode $areaCode $number';
}
