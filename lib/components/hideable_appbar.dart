// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:reader_application/components/custom_appbar.dart';

class HideableCustomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final VoidCallback? onLeadingPressed; // 将 VoidCallback 类型改为 VoidCallback? 类型

  HideableCustomAppBar({Key? key, required this.onLeadingPressed})
      : super(key: key);

  @override
  _HideableCustomAppBarState createState() => _HideableCustomAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _HideableCustomAppBarState extends State<HideableCustomAppBar> {
  bool isAppBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAppBarVisible = !isAppBarVisible;
        });
      },
      child: Scaffold(
        appBar: isAppBarVisible
            ? CustomAppBar(
                onLeadingPressed: widget.onLeadingPressed,
              )
            : null, // 不显示 AppBar
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: isAppBarVisible
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(kToolbarHeight),
                      child: AppBar(),
                    )
                  : const SizedBox(height: kToolbarHeight), // 占位小部件
            ),
            // 其他页面内容
          ],
        ),
      ),
    );
  }
}
