import 'package:flutter/material.dart';
import 'package:flutter_dev_task/models/duration_model.dart';

class LoanSelectionScreenProvider extends ChangeNotifier {
  double mAmountValue = 0;

  double mButtonOpacityValue = 0.0;

  String mSelectedDuration = "Select Duration";
  int mSelectedValue = 0;
  List<DurationModel> mDurationList = [
    DurationModel(mDurationText: "Select Duration", mDurationPeriod: 0),
    DurationModel(mDurationText: "1 Month", mDurationPeriod: 1),
    DurationModel(mDurationText: "3 Months", mDurationPeriod: 3),
    DurationModel(mDurationText: "6 Months", mDurationPeriod: 6),
    DurationModel(mDurationText: "1 Year", mDurationPeriod: 12),
  ];
  double mMonthlyRate = 0;

  calculateMonthlyRate() {
    var result = mAmountValue / mSelectedValue;
    mMonthlyRate = (1 / 100) * result;
    notifyListeners();
  }

  bool mCheckBoxValue = false;
}
