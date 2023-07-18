import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:reader_application/model/book.dart';
import 'package:reader_application/api/select_opus.dart';
import 'package:reader_application/database/books/book_access.dart';

class PopupMenu extends StatelessWidget {
  final Function(List<Book>) updateLibrary; // 回调函数参数

  const PopupMenu({
    Key? key,
    required this.updateLibrary,
  }) : super(key: key);

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
      SelectOpus().getBookFilesList().then((bookList) {
        updateLibrary(bookList); // 调用回调函数更新 BookShelf 的数据

        try {
          insertsBookList(bookList);
        } catch (e) {
          Logger().e(e);
        }
      });
    }
  }

  Future<void> insertsBookList(List<Book> bookList) async {
    int rows = await BookAccess().insertBatchBooks(bookList);
    Logger().i(rows);
  }
}
