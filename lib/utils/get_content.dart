import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';

//根据文本文件的路径:String filePath获读取文本文件中的内容
class GetContent {
  final logger = Logger();

  Future<String> readTextFileLineByLine(String filePath) async {
    try {
      final File file = File(filePath);
      final Stream<String> lines = file
          .openRead()
          .transform(utf8.decoder)
          .transform(const LineSplitter());

      final StringBuffer buffer = StringBuffer();

      await for (final String line in lines) {
        buffer.writeln(line);
      }

      return buffer.toString();
    } catch (e) {
      logger.e('Error reading file: $e');
      return '';
    }
  }
}
