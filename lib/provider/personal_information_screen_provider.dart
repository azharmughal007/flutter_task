import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PersonalInformationScreenProvider extends ChangeNotifier {
  TextEditingController mFirstNameController = TextEditingController();
  TextEditingController mLastNameController = TextEditingController();
  TextEditingController mJobTitleController = TextEditingController();
  TextEditingController mMonthlyIncomeController = TextEditingController();

  FocusNode mFirstNameFocusNode = FocusNode();
  FocusNode mLastNameFocusNode = FocusNode();
  FocusNode mJobTitleFocusNode = FocusNode();
  FocusNode mMonthlyIncomeFocusNode = FocusNode();

  double mButtonOpacityValue = 0.0;
  String mImagePath = "";
  int mRadioValue = -1;

  void handleRadioValueChange(int value) {
    mRadioValue = value;

    switch (mRadioValue) {
      case 1:
        break;
      case 2:
        break;
    }
    if (mFirstNameController.text.isNotEmpty &&
        mLastNameController.text.isNotEmpty &&
        mJobTitleController.text.isNotEmpty &&
        mMonthlyIncomeController.text.isNotEmpty &&
        mRadioValue != -1 &&
        mImagePath.isNotEmpty) {
      mButtonOpacityValue = 1.0;
      notifyListeners();
    }
    notifyListeners();
  }

  final _picker = ImagePicker();

  pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    mImagePath = pickedFile!.path;
    if (mFirstNameController.text.isNotEmpty &&
        mLastNameController.text.isNotEmpty &&
        mJobTitleController.text.isNotEmpty &&
        mMonthlyIncomeController.text.isNotEmpty &&
        mRadioValue != -1 &&
        mImagePath.isNotEmpty) {
      mButtonOpacityValue = 1.0;
      notifyListeners();
    }
    notifyListeners();
  }

  invokeRandomNumberAPI({required BuildContext context}) async {
    var response = await http.get(
      Uri.parse(
          "http://www.randomnumberapi.com/api/v1.0/random?min=1&max=10&count=1"),
    );

    var data = jsonDecode(response.body);
    log("Response is = $data");
    if (data[0] > 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Congratulations you are eligible for this loan :)",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Oops.. you are not eligible for this loan :(",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}
