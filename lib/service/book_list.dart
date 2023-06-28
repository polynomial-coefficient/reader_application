// ignore_for_file: avoid_print
import 'package:reader_application/model/book.dart';
import 'package:logger/logger.dart';

class BookList {
  final logger = Logger();

  List<Book> booksList = [
    Book(filePath: '/path/to/orange.txt')
      ..id = 199
      ..fileName = 'orange',
    Book(filePath: '/path/to/white.txt')
      ..id = 299
      ..fileName = 'white',
    Book(filePath: '/path/to/yellow.txt')
      ..id = 399
      ..fileName = 'yellow',
  ];

  //将文件路径列表转换为 Book 对象数组
  List<Book> convertToValObjList(List<String> files) {
    List<Book> valObjList = [];
    int id = 1;

    for (String file in files) {
      var temp = Book(filePath: file);
      temp.fileName = file.split('/').last;
      temp.id = id;

      valObjList.add(temp);
      id++;
    }
    return valObjList;
  }
}
