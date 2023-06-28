import 'package:flutter/material.dart';

class BottomSheetMenu extends StatelessWidget {
  final List<String> options;

  BottomSheetMenu({required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: buildColumn(context),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        for (String option in options)
          ListTile(
            title: Text(option),
            onTap: () {
              // 处理菜单选项的点击事件
              Navigator.pop(context); // 关闭底部菜单弹窗
            },
          ),
      ],
    );
  }
}
