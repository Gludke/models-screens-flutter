import 'package:flutter/material.dart';

class MsgError extends StatelessWidget {
  final bool visible;
  final String msgError;
  final double? fontSize;

  const MsgError({
    Key? key,
    required this.visible,
    required this.msgError,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        children: [
          Container(height: 10),
          Text(msgError,
              style: TextStyle(fontSize: fontSize ?? 14, color: Colors.red)),
        ],
      ),
    );
  }
}
