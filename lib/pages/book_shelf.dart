// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

import 'package:reader_application/model/book.dart';
import 'package:reader_application/service/book_list.dart';

import 'popup_menu.dart';
import 'search_book.dart';

class BookShelf extends StatelessWidget {
  final List<Book> bookData; // 假设书籍数据存储在这个数组中

  // 构造函数来初始化 bookData
  BookShelf({super.key}) : bookData = BookList().initializeBookData();

  Widget buildBookGrid() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 每行显示的书籍数量
              crossAxisSpacing: 12.0, // 水平间距
              mainAxisSpacing: 10.0, // 垂直间距
            ),
            itemCount: bookData.length,
            shrinkWrap: true, // 将网格布局的高度缩小为所需的最小高度
            physics: const NeverScrollableScrollPhysics(), // 禁止网格布局的滚动
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // 处理点击书籍图标的操作
                  print(bookData[index].id);
                  print(bookData[index].fileName);
                  print(bookData[index].filePath);
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/book_cover.png', // 本地图片的路径
                      width: 60.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    Text(bookData[index].fileName), // 假设书籍对象中有标题属性
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Shelf'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBook(bookData),
              );
            },
          ),
          const PopupMenu(),
        ],
      ),
      body: buildBookGrid(), // 调用封装的方法来构建书籍图标网格
    );
  }
}
