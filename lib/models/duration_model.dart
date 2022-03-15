class DurationModel {
  String? mDurationText;
  int? mDurationPeriod;

  DurationModel({this.mDurationText, this.mDurationPeriod});

  DurationModel.fromJson(Map<String, dynamic> json) {
    mDurationText = json['mDurationText'];
    mDurationPeriod = json['mDurationPeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mDurationText'] = this.mDurationText;
    data['mDurationPeriod'] = this.mDurationPeriod;
    return data;
  }
}
