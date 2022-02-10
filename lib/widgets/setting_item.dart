import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String desc;
  final VoidCallback? onTap;
  final double? fontSize;
  final FontWeight fontWeight;

  const SettingItem(
      {Key? key,
      required this.label,
      this.icon,
      this.desc = "",
      this.onTap,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(icon, color: Colors.blue, size: 24),
                  ),
                Text(
                  label,
                  style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
                )
              ],
            ),
            Row(
              children: [
                Text(desc,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
