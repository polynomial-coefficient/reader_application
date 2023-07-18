// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:reader_application/model/book.dart';
import 'package:reader_application/utils/treat_content.dart';
import 'package:reader_application/model/pagination.dart';
import 'package:reader_application/components/content_region.dart';
import 'package:reader_application/common/global.dart';
import 'package:reader_application/api/handle_ontap.dart';

class PagingManufacture {
  final logger = Logger();
  String docTxt = "";

  void openBook(Book exteriorValue, BuildContext context) {
    logger.i(exteriorValue.filePath.toString());
    //根据file path获取文本中的全部内容
    TreatContent()
        .readTextFileLineByLine(exteriorValue.filePath)
        .then((result) {
      docTxt = result;
      Pagination pagin = fabricateObj(exteriorValue);
      transitionReadingPage(pagin, context);
    });
  }

  void transitionReadingPage(Pagination pagin, BuildContext context) {
    // 导航到 ReadingBookPage 并传递 pagin 参数
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContentRegion(
          pagination: pagin,
          onTap: () {
            HandleOnTap().handleContentRegionOnTap();
          },
        ),
      ),
    );
  }

  //将派送到的book模型对象构造成pagination模型对象,fabricate 制造
  Pagination fabricateObj(Book exteriorValue) {
    List<String> strList = splitTextIntoEqualChunks(docTxt, Global().vol);

    Pagination pagin = Pagination(
        currentPageIndex: 1, fullContent: strList, bookModel: exteriorValue);
    return pagin;
  }

  // 将文本拆分成等长的字符串
  List<String> splitTextIntoEqualChunks(String text, int chunkSize) {
    List<String> result = [];
    int length = text.length;

    for (int i = 0; i < length; i += chunkSize) {
      int endIndex = i + chunkSize;
      if (endIndex > length) {
        endIndex = length;
      }
      String chunk = text.substring(i, endIndex);
      result.add(chunk);
    }
    return result;
  }
}
