import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onLeadingPressed;

  CustomAppBar({this.onLeadingPressed});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  void closeSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
    });
  }

  void _handleBackButton() {
    if (isSearching) {
      closeSearch();
    } else {
      if (widget.onLeadingPressed != null) {
        widget.onLeadingPressed!();
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: _handleBackButton,
        child: const SizedBox(
          width: 48.0, // 指定leading部件的宽度
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      actions: [
        isSearching
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: closeSearch,
              )
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    isSearching = true;
                  });
                },
              ),
      ],
      title: isSearching
          ? TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: '搜索...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              onChanged: (value) {
                // 处理搜索输入变化的逻辑
                // 在这里可以根据输入值进行搜索操作
              },
              onSubmitted: (value) {
                // 处理搜索提交的逻辑
                // 在这里可以执行搜索操作
              },
            )
          : const Text(""),
    );
  }
}
