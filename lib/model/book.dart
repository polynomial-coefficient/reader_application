// ignore_for_file: avoid_print
class Book {
  String filePath;

  Book({
    required this.filePath,
  });

  late int id;
  late String fileName;

  @override
  String toString() {
    return 'id: $id, fileName: $fileName, filePath: $filePath';
  }
}
