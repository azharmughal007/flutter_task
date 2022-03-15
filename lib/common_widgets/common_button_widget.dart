import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final Function()? mOnTap;

  const CommonButtonWidget({
    Key? key,
    required this.mOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        onPressed: mOnTap,
        child: const Center(
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
