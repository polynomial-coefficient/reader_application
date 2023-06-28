// ignore_for_file: avoid_print
import 'package:file_picker/file_picker.dart';

import 'package:reader_application/service/book_list.dart';
import 'package:reader_application/model/book.dart';

class SelectOpus {
  Future<List<Book>> getBookFilesList() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, // 启用多选
        type: FileType.custom, // 指定选择文件类型
        allowedExtensions: ['pdf', 'txt', 'log'], // 允许的文件扩展名列表
      );

      if (result != null && result.files.isNotEmpty) {
        final List<String> filePaths =
            result.files.map((file) => file.path!).toList();

        final BookList bookList = BookList();
        final List<Book> valObjList = bookList.convertToValObjList(filePaths);

        return valObjList; // 返回valObjList
      } else {
        // 用户未选择文件
        print('No files selected.');
      }
    } catch (e) {
      // 异常处理
      print('Error: $e');
    }

    return []; // 返回空的valObjList
  }
}
