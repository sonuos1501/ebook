// ignore_for_file: unnecessary_await_in_return, avoid_positional_boolean_parameters
part of '../../utils.dart';

mixin StoragesHelper {
  /// Theme:---------------------------------------------------------------------
  bool get isDarkMode;

  void changeBrightnessToDark({required bool value});

  /// Language:------------------------------------------------------------------
  String get currentLanguage;

  void changeLanguage(String language);

  /// Check new install application:--------------------------------------------
  bool get appNewInstall;

  void saveAppNewInstall(bool appNewInstall);

  /// Save book publishes:--------------------------------------------
  int? get idBookPublisher;

  void saveBookPublisher(int id);

  List<Book> get booksReadRecently;

  void saveBooksReadRecently(List<Book> booksReadRecently);

  ChildrenEntity? get childrenEntity;

  void saveChildrenEntity(ChildrenEntity childrenEntity);

  List<BookPublisher> get listBookPublisher;

  void saveListBookPublisher(List<BookPublisher> listBookPublisher);

  String get dataBook;

  void saveDataBook(String dataBook);

  List<Book> booksByClass({
    required int idBookPublisher,
    required int idClass,
  });

  void saveBooksByClass(
    List<Book> books, {
    required int idBookPublisher,
    required int idClass,
  });
}
