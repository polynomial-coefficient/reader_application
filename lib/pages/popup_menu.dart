// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => buildPopupMenuItems(),
      onSelected: (String value) => executeByVal(value),
    );
  }

  List<PopupMenuEntry<String>> buildPopupMenuItems() {
    return <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'add_book',
        child: Text('Add Book'),
      ),
      const PopupMenuDivider(
        height: 10,
      ),
      const PopupMenuItem<String>(
        value: 'select_folder',
        child: Text('Select Folder'),
      ),
    ];
  }

  void executeByVal(String value) {
    if (value == 'add_book') {
      print('add a book');
    } else if (value == 'select_folder') {
      print('select a folder');
    }
  }
}
