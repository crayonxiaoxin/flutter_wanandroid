import 'package:flutter/material.dart';

class TagGroup extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const TagGroup(this.title, {Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "$title",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: children,
          )
        ],
      ),
    );
  }
}

class TagGroupItem extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const TagGroupItem(this.title, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _tag(context);
  }

  _tag(BuildContext context) {
    // var themeProvider = context.watch<ThemeProvider>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          // color:
          //     themeProvider.isDarkMode() ? Colors.grey[600] : Colors.grey[200],
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: 32,
              alignment: Alignment.center,
              child: Text(
                "$title",
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
