import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormFieldWidget extends StatefulWidget {
  final FocusNode mFocusNode;
  final TextEditingController mTextEditingController;
  final TextInputAction mTextInputAction;
  final TextInputType mTextInputType;
  final String mLabelText;
  final List<TextInputFormatter>? mListInputFormatters;

  const CommonTextFormFieldWidget({
    Key? key,
    required this.mFocusNode,
    required this.mTextEditingController,
    required this.mTextInputAction,
    required this.mTextInputType,
    required this.mLabelText,
    required this.mListInputFormatters,
  }) : super(key: key);

  @override
  _CommonTextFormFieldWidgetState createState() =>
      _CommonTextFormFieldWidgetState();
}

class _CommonTextFormFieldWidgetState extends State<CommonTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.mTextEditingController,
      keyboardType: widget.mTextInputType,
      textInputAction: widget.mTextInputAction,
      focusNode: widget.mFocusNode,
      inputFormatters: widget.mListInputFormatters,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        labelText: widget.mLabelText,
        labelStyle: TextStyle(
          color: widget.mFocusNode.hasFocus ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
