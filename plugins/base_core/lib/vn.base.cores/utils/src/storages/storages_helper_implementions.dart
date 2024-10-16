// ignore_for_file: unnecessary_await_in_return

import 'dart:convert';

import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/vn.app.ebook/presenter/model/books.dart';

import '../../../common/storage.dart';
import '../../utils.dart';
import 'constants/storages.dart';

class StoragesHelperImpl implements StoragesHelper {
  @override
  void changeBrightnessToDark({required bool value})  =>
     StorageService.to.setBool(Storages.is_dark_mode, value);

  @override
  void changeLanguage(String language)  =>
      StorageService.to.setString(Storages.current_language, language);

  @override
  String get currentLanguage  =>
      StorageService.to.getString(Storages.current_language) ?? '';

  @override
  bool get isDarkMode  =>
      StorageService.to.getBool(Storages.is_dark_mode);

  @override
  bool get appNewInstall  =>
      StorageService.to.getBool(Storages.app_new_installed);

  @override
  void saveAppNewInstall(bool appNewInstall)  =>
      StorageService.to.setBool(Storages.app_new_installed, appNewInstall);

  @override
  int? get idBookPublisher  =>
      StorageService.to.getInt(Storages.book_publisher);

  @override
  void saveBookPublisher(int id)  =>
      StorageService.to.setInt(Storages.book_publisher, id);

  @override
  List<Book> get booksReadRecently  {
    final result =
        StorageService.to.getList(Storages.books_read_recently);
    final books = result.map((e) {
      return Book.fromJson(jsonDecode(e));
    }).toList();

    return books;
  }

  @override
  void saveBooksReadRecently(List<Book> booksReadRecently)  {
    final books = booksReadRecently.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
    StorageService.to.setList(
      Storages.books_read_recently,
      books.isEmpty ? [] : books,
    );
  }

  @override
  void saveChildrenEntity(ChildrenEntity childrenEntity)  {
    StorageService.to.setString(
      Storages.childrenEntity,
      jsonEncode(childrenEntity.toJson()),
    );
  }

  @override
  ChildrenEntity? get childrenEntity  {
    final result = StorageService.to.getString(Storages.childrenEntity) ?? '';
    final user =
        result.isEmpty ? null : ChildrenEntity.fromJson(jsonDecode(result));
    return user;
  }

  @override
  List<BookPublisher> get listBookPublisher  {
    final result = StorageService.to.getString(Storages.list_book_publisher) ?? '';
    final booksPublisher = result.isEmpty
        ? <BookPublisher>[]
        : listBookPublisherFromJson(
            (jsonDecode(result) as List)
                .map((e) => e as Map<String, dynamic>)
                .toList(),
          );
    return booksPublisher;
  }

  @override
  void saveListBookPublisher(
    List<BookPublisher> listBookPublisher,
  )  {
    StorageService.to.setString(
      Storages.list_book_publisher,
      jsonEncode(listBookPublisherToJson(listBookPublisher)),
    );
  }

  @override
  String get dataBook  {
    final result = StorageService.to.getString(Storages.data_book) ?? '';
    return result;
  }

  @override
  void saveDataBook(String dataBook)  {
    StorageService.to.setString(Storages.data_book, dataBook);
  }

  @override
  List<Book> booksByClass({
    required int idBookPublisher,
    required int idClass,
  })  {
    final result = StorageService.to.getList(
      '${Storages.data_book}_${idBookPublisher}_$idClass',
    );
    final books = result.map((e) {
      return Book.fromJson(jsonDecode(e));
    }).toList();

    return books;
  }

  @override
  void saveBooksByClass(
    List<Book> books, {
    required int idBookPublisher,
    required int idClass,
  })  {
    final data = books.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
    StorageService.to.setList(
      '${Storages.data_book}_${idBookPublisher}_$idClass',
      data.isEmpty ? [] : data,
    );
  }
}
