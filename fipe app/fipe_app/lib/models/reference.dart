class Reference {
  String? code;
  String? month;

  Reference({this.code, this.month});

  Reference.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['month'] = month;
    return data;
  }
}
