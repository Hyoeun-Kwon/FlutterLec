import 'package:mybook_list/bookInfo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  // Create DB & Table
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'mybook.db'),
      onCreate: (database, version) async {
        await database.execute(
            "create table bookinfo(bookId integer primary key autoincrement, bookImage text, bookTitle text, bookPublisher text, bookAuthors text, writeDate text, bookReview text)");
      },
      version: 1,
    );
  }

  Future<int> insertBookInfo(List<BookInfo> bookinfos) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var bookinfo in bookinfos) {
      result = await db.rawInsert(
          'insert into bookinfo(bookImage, bookTitle, bookAuthors, writeDate) values (?,?,?,?)',
          [
            bookinfo.bookImage,
            bookinfo.bookTitle,
            bookinfo.bookAuthors,
            bookinfo.writeDate
          ]);
    }
    return result;
  }

  Future<List<BookInfo>> queryBookInfo() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from bookinfo');
    return queryResult.map((e) => BookInfo.fromMap(e)).toList();
  }

  Future<void> deleteBookInfo(int bookId) async {
    final Database db = await initializeDB();
    await db.rawDelete('delete from bookinfo where bookId = ?', [bookId]);
  }

  Future<int> updateBookInfo(List<BookInfo> bookinfos) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var bookinfo in bookinfos) {
      result = await db.rawUpdate(
          'update bookinfo set bookReview = ? where bookId = ?',
          [bookinfo.bookReview, bookinfo.bookId]);
    }
    return result;
  }
} // DatabaseHandler
