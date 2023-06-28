import 'package:flutter/material.dart';
import 'package:reader_application/model/pagination.dart';
import 'package:reader_application/components/bottom_sheet_menu.dart';

class ReadingBookPage extends StatefulWidget {
  final Pagination pagination;

  ReadingBookPage({required this.pagination});

  @override
  _ReadingBookPageState createState() => _ReadingBookPageState();
}

class _ReadingBookPageState extends State<ReadingBookPage> {
  @override
  Widget build(BuildContext context) {
    String currentPageContent =
        widget.pagination.fullContent[widget.pagination.currentPageIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pagination.bookModel.fileName),
      ),
      body: buildGestureDetector(currentPageContent, context),
    );
  }

  GestureDetector buildGestureDetector(
      String currentPageContent, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottomSheetMenu(context);
      },
      child: buildStack(currentPageContent),
    );
  }

  Stack buildStack(String currentPageContent) {
    return Stack(
      children: [
        Center(
          child: Text(currentPageContent),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Text(
            '${widget.pagination.currentPageIndex}/${widget.pagination.totalPages}',
          ),
        ),
      ],
    );
  }

  void _showBottomSheetMenu(BuildContext context) {
    List<String> options = ["Option 1", "Option 2", "Option 3"];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetMenu(options: options);
      },
    );
  }
}
