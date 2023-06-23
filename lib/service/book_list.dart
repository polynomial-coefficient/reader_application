import 'package:reader_application/model/book.dart';

class BookList {
  List<Book> booksData = [
    Book(
      filePath: '/path/red.txt',
      id: 0,
      fileName: 'red',
    ),
    Book(
      filePath: '/path/green.txt',
      id: 1,
      fileName: 'green',
    ),
    Book(
      filePath: '/path/blue.txt',
      id: 2,
      fileName: 'blue',
    ),
    Book(
      filePath: '/path/pink.txt',
      id: 3,
      fileName: 'pink',
    ),
    Book(
      filePath: '/path/orange.txt',
      id: 4,
      fileName: 'orange',
    ),
    Book(
      filePath: '/path/yellow.txt',
      id: 5,
      fileName: 'yellow',
    ),
  ];

  List<Book> initializeBookData() {
    return booksData;
  }
}
