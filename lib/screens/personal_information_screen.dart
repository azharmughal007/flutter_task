import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../common_widgets/common_button_widget.dart';
import '../common_widgets/common_text_form_field_widget.dart';
import '../provider/personal_information_screen_provider.dart';

class PersonalInformationScreen extends StatefulWidget {
  final String mSelectedLoanAmount, mSelectedTimePeriod, mMonthlyRateValue;

  const PersonalInformationScreen({
    Key? key,
    required this.mSelectedLoanAmount,
    required this.mSelectedTimePeriod,
    required this.mMonthlyRateValue,
  }) : super(key: key);

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  void initState() {
    var _provider =
        Provider.of<PersonalInformationScreenProvider>(context, listen: false);
    _provider.mFirstNameController.addListener(
      () {
        if (_provider.mFirstNameController.text.isNotEmpty &&
            _provider.mLastNameController.text.isNotEmpty &&
            _provider.mJobTitleController.text.isNotEmpty &&
            _provider.mMonthlyIncomeController.text.isNotEmpty &&
            _provider.mRadioValue != -1 &&
            _provider.mImagePath.isNotEmpty) {
          setState(() {
            _provider.mButtonOpacityValue = 1.0;
          });
        } else {
          _provider.mButtonOpacityValue = 0.0;
        }
      },
    );
    _provider.mLastNameController.addListener(() {
      if (_provider.mFirstNameController.text.isNotEmpty &&
          _provider.mLastNameController.text.isNotEmpty &&
          _provider.mJobTitleController.text.isNotEmpty &&
          _provider.mMonthlyIncomeController.text.isNotEmpty &&
          _provider.mRadioValue != -1 &&
          _provider.mImagePath.isNotEmpty) {
        setState(() {
          _provider.mButtonOpacityValue = 1.0;
        });
      } else {
        _provider.mButtonOpacityValue = 0.0;
      }
    });
    _provider.mJobTitleController.addListener(() {
      if (_provider.mFirstNameController.text.isNotEmpty &&
          _provider.mLastNameController.text.isNotEmpty &&
          _provider.mJobTitleController.text.isNotEmpty &&
          _provider.mMonthlyIncomeController.text.isNotEmpty &&
          _provider.mRadioValue != -1 &&
          _provider.mImagePath.isNotEmpty) {
        setState(() {
          _provider.mButtonOpacityValue = 1.0;
        });
      } else {
        _provider.mButtonOpacityValue = 0.0;
      }
    });
    _provider.mMonthlyIncomeController.addListener(() {
      if (_provider.mFirstNameController.text.isNotEmpty &&
          _provider.mLastNameController.text.isNotEmpty &&
          _provider.mJobTitleController.text.isNotEmpty &&
          _provider.mMonthlyIncomeController.text.isNotEmpty &&
          _provider.mRadioValue != -1 &&
          _provider.mImagePath.isNotEmpty) {
        setState(() {
          _provider.mButtonOpacityValue = 1.0;
        });
      } else {
        _provider.mButtonOpacityValue = 0.0;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonalInformationScreenProvider>(
      builder: (context, _provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Personal Information"),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
            bottom: PreferredSize(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Center(
                    child: Icon(
                      Icons.euro_symbol,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                title: const Text(
                  "Monthly Rate",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
                subtitle: Text(
                  widget.mMonthlyRateValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              preferredSize: const Size.fromHeight(60),
            ),
          ),
          body: ListView(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonTextFormFieldWidget(
                        mTextEditingController: _provider.mFirstNameController,
                        mFocusNode: _provider.mFirstNameFocusNode,
                        mLabelText: "First Name",
                        mTextInputType: TextInputType.text,
                        mTextInputAction: TextInputAction.next,
                        mListInputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CommonTextFormFieldWidget(
                        mTextEditingController: _provider.mLastNameController,
                        mFocusNode: _provider.mLastNameFocusNode,
                        mLabelText: "Last Name",
                        mTextInputType: TextInputType.text,
                        mTextInputAction: TextInputAction.next,
                        mListInputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CommonTextFormFieldWidget(
                  mTextEditingController: _provider.mJobTitleController,
                  mFocusNode: _provider.mJobTitleFocusNode,
                  mLabelText: "Job Title",
                  mTextInputType: TextInputType.text,
                  mTextInputAction: TextInputAction.next,
                  mListInputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CommonTextFormFieldWidget(
                  mTextEditingController: _provider.mMonthlyIncomeController,
                  mFocusNode: _provider.mMonthlyIncomeFocusNode,
                  mLabelText: "Monthly Income",
                  mTextInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                  mTextInputAction: TextInputAction.done,
                  mListInputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Occupation Status",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Theme(
                          child: Radio(
                            value: 1,
                            groupValue: _provider.mRadioValue,
                            onChanged: (int? value) {
                              _provider.handleRadioValueChange(value!);
                            },
                          ),
                          data: ThemeData(
                            unselectedWidgetColor: Colors.grey,
                          ),
                        ),
                        const Text(
                          "Employed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Theme(
                          child: Radio(
                            value: 2,
                            groupValue: _provider.mRadioValue,
                            onChanged: (int? value) {
                              _provider.handleRadioValueChange(value!);
                            },
                          ),
                          data: ThemeData(
                            unselectedWidgetColor: Colors.grey,
                          ),
                        ),
                        const Text(
                          "Un-Employed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upload Invoice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Material(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: _provider.mImagePath.isEmpty
                            ? InkWell(
                                onTap: () {
                                  _provider.pickImage();
                                },
                                child: const Center(
                                  child: Icon(
                                    Icons.cloud_upload_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.file(
                                  File(_provider.mImagePath),
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _provider.mButtonOpacityValue,
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButtonWidget(
                    mOnTap: () {
                      _provider.invokeRandomNumberAPI(context: context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
