import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';

//根据文本文件的路径:String filePath获读取文本文件中的内容
class TreatContent {
  final logger = Logger();

  Future<String> readTextFileLineByLine(String filePath) async {
    try {
      final StringBuffer buffer = StringBuffer();
      final File file = File(filePath);
      final Stream<String> lines = file
          .openRead()
          .transform(utf8.decoder)
          .transform(const LineSplitter());

      await for (final String line in lines) {
        // 检查是否为空行，如果是空行则跳过
        if (line.trim().isNotEmpty) {
          //保留文本文件中的转义字符 \r 和 \n
          final String processedLine =
              line.replaceAll('\r', '\\r').replaceAll('\n', '\\n');
          buffer.writeln(processedLine);
        }
      }

      return buffer.toString();
    } catch (e) {
      logger.e('Error reading file: $e');
      return '';
    }
  }
}
