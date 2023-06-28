// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:reader_application/model/book.dart';

//分页
class Pagination {
  int currentPageIndex; // 当前页索引
  List<String> fullContent; //全部的文本数据
  Book bookModel;

  Pagination({
    required this.currentPageIndex,
    required this.fullContent,
    required this.bookModel,
  });

  int contentVolume = 120; // 每页内容的字符数量
  late int totalPages = fullContent.length - 1; // 总页数
  bool get hasPreviousPage => currentPageIndex > 0; // 是否有上一页
  bool get hasNextPage => currentPageIndex < totalPages; // 是否有下一页
}
