import 'package:reader_application/model/book.dart';

class BooklistProvider {
  //将文件路径列表转换为 Book 对象数组
  List<Book> convert2ValObjList(List<String> files) {
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
