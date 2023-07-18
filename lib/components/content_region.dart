// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:reader_application/model/pagination.dart';

class ContentRegion extends StatefulWidget {
  final Pagination pagination;
  final Function()? onTap;

  ContentRegion({required this.pagination, this.onTap});

  @override
  _ContentRegionState createState() => _ContentRegionState();
}

class _ContentRegionState extends State<ContentRegion> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return buildSafeArea();
  }

  SafeArea buildSafeArea() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 250, 249, 222),
            height: 35.0,
            child: buildCenterArea(),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white,
              child: Center(child: buildPageView()),
            ),
          ),
          SizedBox(
            height: 20.0,
            child: Center(
              child: buildIndexContainer(),
            ),
          ),
        ],
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      itemCount: widget.pagination.fullContent.length,
      onPageChanged: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      itemBuilder: (context, index) {
        final pageContent = widget.pagination.fullContent[index];
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            color: const Color.fromARGB(255, 250, 249, 222),
            alignment: Alignment.topLeft,
            child: Text(
              pageContent,
              style: const TextStyle(
                height: 1.5,  
                fontSize: 22.0,  
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }

  Container buildIndexContainer() {
    return Container(
      color: const Color.fromARGB(255, 250, 249, 222),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '${_currentPageIndex + 1}/${widget.pagination.fullContent.length}',
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Center buildCenterArea() {
    String fileName = widget.pagination.bookModel.fileName.split('.').first;
    return Center(
      child: Text(
        fileName,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
