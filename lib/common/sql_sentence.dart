import 'package:reader_application/common/global.dart';

class SqlSentence {
  String createBooksTable = """
            CREATE TABLE ${Global().booksTableName} (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              file_path TEXT NOT NULL,
              UNIQUE(file_path)
            )""";
}
