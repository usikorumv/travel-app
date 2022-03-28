import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPasswordField,
    this.textInputType,
    this.onChanged,
  }) : super(key: key);

  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefixIcon, suffixIcon;
  final bool? isPasswordField;
  final Function(String)? onChanged;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = widget.isPasswordField ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        onChanged: (text) {
          widget.onChanged!(text);
        },
        keyboardType: widget.textInputType ?? TextInputType.text,
        textInputAction: TextInputAction.search,
        obscureText: !_isVisible,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: widget.prefixIcon ?? SizedBox(),
          suffixIcon: widget.suffixIcon != null
              ? widget.suffixIcon ?? SizedBox()
              : _isPasswordField
                  ? _isVisible
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.visibility_off_rounded),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.visibility_rounded),
                        )
                  : SizedBox(),
          hintText: widget.hintText ?? 'Enter the text...',
          hintStyle: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
