//分页
class TextPaginationData {
  String fullContent; // 全部内容数据
  int pageSize; // 每页内容的固定长度
  int totalPages; // 总页数
  int currentPageIndex; // 当前页索引

  TextPaginationData({
    required this.fullContent,
    required this.pageSize,
    required this.totalPages,
    required this.currentPageIndex,
  });

  bool get hasPreviousPage => currentPageIndex > 0; // 是否有上一页
  bool get hasNextPage => currentPageIndex < totalPages - 1; // 是否有下一页
}
