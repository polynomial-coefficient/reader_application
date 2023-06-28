import 'package:flutter/material.dart';
import 'package:reader_application/model/book.dart';

class SearchBook extends SearchDelegate<String> {
  final List<Book> booksReserve; // 假设书籍数据存储在这个数组中,Reserve:储备

  SearchBook(this.booksReserve);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // 清除搜索关键字
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // 返回空字符串，表示没有选择任何结果
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Book> searchResults = booksReserve
        .where(
            (book) => book.fileName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].fileName),
          onTap: () {
            close(context, searchResults[index].fileName); // 返回选中的搜索结果
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Book> suggestionList = booksReserve
        .where((book) =>
            book.fileName.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].fileName),
          onTap: () {
            query = suggestionList[index].fileName; // 更新搜索关键字为选中的建议结果
            showResults(context);
          },
        );
      },
    );
  }
}
