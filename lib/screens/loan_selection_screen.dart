import 'package:flutter/material.dart';
import 'package:flutter_dev_task/provider/loan_selection_screen_provider.dart';
import 'package:flutter_dev_task/screens/personal_information_screen.dart';
import 'package:provider/provider.dart';
import '../common_widgets/common_button_widget.dart';

class LoanSelectionScreen extends StatefulWidget {
  const LoanSelectionScreen({Key? key}) : super(key: key);

  @override
  _LoanSelectionScreenState createState() => _LoanSelectionScreenState();
}

class _LoanSelectionScreenState extends State<LoanSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoanSelectionScreenProvider>(
      builder: (context, _provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Select Loan"),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Select Desired Loan Amount",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Slider(
                value: _provider.mAmountValue,
                max: 1000,
                divisions: 20,
                label: _provider.mAmountValue.round().toString() + "€",
                onChanged: (double value) {
                  setState(
                    () {
                      _provider.mAmountValue = value;
                      if (_provider.mSelectedValue > 0 &&
                          _provider.mAmountValue > 0) {
                        _provider.mButtonOpacityValue = 1.0;
                        _provider.calculateMonthlyRate();
                      } else {
                        _provider.mButtonOpacityValue = 0.0;
                      }
                    },
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 24),
                child: Text(
                  "Select Time Period",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: DropdownButton(
                  items: _provider.mDurationList.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.mDurationPeriod.toString(),
                      child: Text(
                        item.mDurationText ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  selectedItemBuilder: (BuildContext context) {
                    return _provider.mDurationList.map((item) {
                      return Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.mDurationText ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      );
                    }).toList();
                  },
                  isExpanded: true,
                  elevation: 2,
                  onChanged: (value) {
                    setState(() {
                      _provider.mSelectedValue = int.parse(value.toString());
                      if (_provider.mSelectedValue > 0 &&
                          _provider.mAmountValue > 0) {
                        _provider.mButtonOpacityValue = 1.0;
                        _provider.calculateMonthlyRate();
                      } else {
                        _provider.mButtonOpacityValue = 0.0;
                      }
                    });
                  },
                  value: _provider.mSelectedValue.toString(),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _provider.mButtonOpacityValue,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 24),
                  child: Text(
                    "Monthly rate : ${_provider.mMonthlyRate.toStringAsFixed(2)} €",
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _provider.mButtonOpacityValue,
            child: SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.grey),
                        child: Checkbox(
                          value: _provider.mCheckBoxValue,
                          onChanged: (value) {
                            setState(() {
                              _provider.mCheckBoxValue =
                                  !_provider.mCheckBoxValue;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Agree with Terms and Conditions",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  CommonButtonWidget(
                    mOnTap: () {
                      if (_provider.mCheckBoxValue) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalInformationScreen(
                              mSelectedLoanAmount:
                                  _provider.mAmountValue.toString(),
                              mSelectedTimePeriod:
                                  _provider.mSelectedValue.toString(),
                              mMonthlyRateValue:
                                  "${_provider.mMonthlyRate.toStringAsFixed(2)} €",
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "You need to agree with our Terms and Conditions",
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
