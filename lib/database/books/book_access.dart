import 'package:sqflite/sqflite.dart';

import 'package:reader_application/model/book.dart';
import 'package:reader_application/common/sql_sentence.dart';
import 'package:reader_application/common/global.dart';

import 'package:reader_application/database/base/database_creator.dart';

class BookAccess {
  late Database dbConnect;

  BookAccess() {
    initializeDB();
  }

  Future<void> initializeDB() async {
    dbConnect = await DatabaseCreator().initializationDataBase(
        Global().booksDataBaseName, SqlSentence().createBooksTable);
  }

  // insert into book-database
  Future<int> insertBook(Book bookModel) async {
    int result =
        await dbConnect.insert(Global().booksTableName, bookModel.toMap());
    return result;
  }

  Future<int> insertBatchBooks(List<Book> bookList) async {
    int lines = 0;
    for (var book in bookList) {
      lines = await insertBook(book);
    }
    return lines;
  }

  //query database
  Future<List<Book>> getBooksList() async {
    List<Map<String, dynamic>> queryRes =
        await dbConnect.query(Global().booksTableName, orderBy: 'id DESC');

    return bookMap2List(queryRes);
  }

  List<Book> bookMap2List(List<Map<String, dynamic>> queryRes) {
    List<Book> bookList = [];

    for (var map in queryRes) {
      int? id = map['id'];
      String? filePath = map['filePath'];

      if (id != null && filePath != null) {
        Book book = Book(filePath: filePath);
        book.id = id;
        book.fileName = filePath.split('/').last.split('.').first;

        bookList.add(book);
      }
    }

    return bookList;
  }
}
