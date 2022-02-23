import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final double height;
  final Decoration? decoration;
  final double fontSize;
  final String hintText;
  final bool autofocus;
  final bool showClearIcon;

  const SearchBox(
      {Key? key,
      this.textEditingController,
      this.onChanged,
      this.onSubmitted,
      this.onClear,
      this.height = 32,
      this.decoration,
      this.fontSize = 14,
      this.hintText = "支持多个关键词，请用空格隔开",
      this.autofocus = false,
      this.showClearIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSearchBox();
  }

  final OutlineInputBorder _border = const OutlineInputBorder(
      gapPadding: 0, borderSide: BorderSide(color: Colors.transparent));

  Container _buildSearchBox() {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: decoration ??
          BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: TextField(
        controller: textEditingController,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        autofocus: autofocus,
        style: TextStyle(fontSize: fontSize, color: Colors.black87),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            isCollapsed: false,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: fontSize, color: Colors.grey),
            suffixIcon: showClearIcon
                ? InkWell(
                    onTap: onClear,
                    child: const Icon(
                      Icons.clear_outlined,
                      color: Colors.grey,
                    ),
                  )
                : null,
            border: _border,
            disabledBorder: _border,
            enabledBorder: _border,
            errorBorder: _border,
            focusedBorder: _border,
            focusedErrorBorder: _border),
      ),
    );
  }
}
