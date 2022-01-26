import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter/material.dart';
import 'package:lx_base/utils/string_utils.dart';

/// 设置条目开关
class SwitchItem extends StatefulWidget {
  final String label;
  final bool value;
  final String? desc;
  final bool disabled;
  final ValueChanged<bool>? onChanged;

  const SwitchItem(
      {Key? key,
      required this.label,
      required this.value,
      this.desc,
      this.onChanged,
      this.disabled = false})
      : super(key: key);

  @override
  _SwitchItemState createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return _settingItem();
  }

  Padding _settingItem() {
    var color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.disabled ? Colors.grey : Colors.black87)),
              if (isNotEmpty(widget.desc))
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "${widget.desc}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
            ],
          ),
          CupertinoSwitch(
              value: widget.value,
              activeColor: color,
              onChanged: widget.disabled
                  ? null
                  : (v) {
                      setState(() {
                        value = v;
                      });
                      widget.onChanged?.call(v);
                    })
        ],
      ),
    );
  }
}
