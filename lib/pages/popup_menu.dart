// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

import 'package:reader_application/model/book.dart';
import 'package:reader_application/service/book_list.dart';
import 'package:reader_application/service/select_opus.dart';

class PopupMenu extends StatelessWidget {
  final Function(List<Book>) updateLibrary; // 回调函数参数

  PopupMenu({
    Key? key,
    required this.updateLibrary,
  }) : super(key: key);

  List<Book> stockList = [];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => buildPopupMenuItems(),
      onSelected: (String value) => executed(context, value),
    );
  }

  List<PopupMenuEntry<String>> buildPopupMenuItems() {
    return <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'NimbleImport',
        child: Text('Nimble import'),
      ),
      const PopupMenuDivider(
        height: 10,
      ),
      const PopupMenuItem<String>(
        value: 'ManualImport',
        child: Text('Manual import'),
      ),
    ];
  }

  void executed(BuildContext context, String value) {
    if (value == 'ManualImport') {
      SelectOpus().getBookFilesList().then((valObjList) {
        stockList = BookList().booksList + valObjList;
        updateLibrary(stockList); // 调用回调函数更新 BookShelf 的数据
      });
    }
  }
}
