import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:reader_application/model/book.dart';
import 'package:reader_application/api/paging_manufacture.dart';
import 'package:reader_application/database/books/book_access.dart';

import 'popup_menu.dart';
import 'search_book.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key}) : super(key: key);

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  final Logger logger = Logger();

  List<Book> library = []; // 假设书籍数据存储在这个数组中

  @override
  void initState() {
    super.initState();
    loadBooksList();
  }

  Future<void> loadBooksList() async {
    List<Book> resultList = await BookAccess().getBooksList();
    if (resultList.isNotEmpty) {
      setState(() {
        library = resultList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Shelf'),
        actions: [
          buildSearchIconButton(context),
          PopupMenu(updateLibrary: updateLibrary),
        ],
      ),
      body: buildBookGrid(), // 调用封装的方法来构建书籍图标网格
    );
  }

  // 回调函数，用于更新 library 数据
  void updateLibrary(List<Book> newLibrary) {
    logger.i(newLibrary.length);
    logger.i(newLibrary.isEmpty);
    setState(() {
      library.addAll(newLibrary);
    });
  }

  Widget buildSearchIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        showSearch(
          context: context,
          delegate: SearchBook(library),
        );
      },
    );
  }

  Widget buildBookItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        PagingManufacture().openBook(library[index], context); // 处理点击书籍图标的操作
      },
      child: buildBookAppearColumn(index),
    );
  }

  Column buildBookAppearColumn(int index) {
    int nameSizeLimit = 7;
    return Column(
      children: [
        Image.asset(
          'assets/images/book_cover.png',
          width: 60.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        Expanded(
          // Wrap with Expanded
          child: Wrap(
            children: [
              Text(
                  formatText(
                    library[index].fileName.split('.').first,
                    nameSizeLimit,
                  ),
                  style: const TextStyle(
                    fontSize: 12.0,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  String formatText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      List<String> lines = [];
      while (text.isNotEmpty) {
        if (text.length <= maxLength) {
          lines.add(text);
          text = '';
        } else {
          lines.add(text.substring(0, maxLength));
          text = text.substring(maxLength);
        }
      }
      return lines.join('\n');
    }
  }

  SliverGridDelegateWithFixedCrossAxisCount buildSliverGrid() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, // 每行显示的书籍数量
      crossAxisSpacing: 12.0, // 水平间距
      mainAxisSpacing: 10.0, // 垂直间距
    );
  }

  Widget buildBookGrid() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: buildSliverGrid(),
            itemCount: library.length,
            shrinkWrap: true, // 将网格布局的高度缩小为所需的最小高度
            physics: const NeverScrollableScrollPhysics(), // 禁止网格布局的滚动
            itemBuilder: (context, index) => buildBookItem(context, index),
          ),
        ],
      ),
    );
  }
}
