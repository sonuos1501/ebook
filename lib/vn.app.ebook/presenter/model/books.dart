// ignore_for_file: must_be_immutable, avoid_dynamic_calls, unnecessary_lambdas, inference_failure_on_untyped_parameter, depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';

class Book extends Equatable {
  Book({
    required this.id,
    required this.name,
    required this.image,
    required this.link,
    this.currentPage,
    this.maxPage,
    this.groupBookTable,
    this.infoBook,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      link: json['link'],
      currentPage: json['currentPage'],
      maxPage: json['maxPage'],
      groupBookTable: json['groupBookTable'] == null
          ? []
          : List<GroupBookTable>.from(
              (json['groupBookTable'] as List)
                  .map((e) => GroupBookTable.fromJson(e)),
            ),
      infoBook:
          json['infoBook'] == null ? null : InfoBook.fromJson(json['infoBook']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'link': link,
      'currentPage': currentPage,
      'maxPage': maxPage,
      'groupBookTable': groupBookTable == null
          ? <Map<String, dynamic>>[]
          : List<Map<String, dynamic>>.from(
              groupBookTable!.map((x) => x.toJson()),
            ),
      'infoBook': infoBook?.toJson(),
    };
  }

  final int id;
  final String name;
  final String image;
  final String link;
  int? currentPage;
  int? maxPage;
  List<GroupBookTable>? groupBookTable;
  InfoBook? infoBook;

  Book copyWith({
    int? id,
    String? name,
    String? image,
    String? link,
    int? currentPage,
    int? maxPage,
    List<GroupBookTable>? groupBookTable,
    InfoBook? infoBook,
  }) =>
      Book(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        link: link ?? this.link,
        currentPage: currentPage ?? this.currentPage,
        maxPage: maxPage ?? this.maxPage,
        groupBookTable: groupBookTable ?? this.groupBookTable,
        infoBook: infoBook ?? this.infoBook,
      );

  @override
  List<Object?> get props => [id, currentPage, link];
}

class Page {
  Page({
    this.pageNumber,
    this.pageText,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageNumber: json['pageNumber'],
        pageText: json['pageText'],
      );
  int? pageNumber;
  String? pageText;

  Page copyWith({
    int? pageNumber,
    String? pageText,
  }) =>
      Page(
        pageNumber: pageNumber ?? this.pageNumber,
        pageText: pageText ?? this.pageText,
      );

  Map<String, dynamic> toJson() => {
        'pageNumber': pageNumber,
        'pageText': pageText,
      };
}

class InfoBook {
  InfoBook({
    required this.nameBooks,
    required this.bookPublisher,
    required this.yearPublish,
    required this.numPage,
    required this.introduction,
    required this.bookEditorInChief,
    required this.bookEditor,
    required this.bookAuthor,
  });

  factory InfoBook.fromJson(Map<String, dynamic> json) => InfoBook(
        nameBooks: json['nameBooks'],
        bookPublisher: json['bookPublisher'],
        yearPublish: json['yearPublish'],
        numPage: json['numPage'],
        introduction: json['introduction'],
        bookEditorInChief: List<String>.from(
          (json['bookEditorInChief'] as List).map((x) => x),
        ),
        bookEditor:
            List<String>.from((json['bookEditor'] as List).map((x) => x)),
        bookAuthor:
            List<String>.from((json['bookAuthor'] as List).map((x) => x)),
      );
  String nameBooks;
  String bookPublisher;
  int yearPublish;
  int numPage;
  String introduction;
  List<String> bookEditorInChief;
  List<String> bookEditor;
  List<String> bookAuthor;

  Map<String, dynamic> toJson() => {
        'nameBooks': nameBooks,
        'bookPublisher': bookPublisher,
        'yearPublish': yearPublish,
        'numPage': numPage,
        'introduction': introduction,
        'bookEditorInChief': bookEditorInChief.map((x) => x).toList(),
        'bookEditor': bookEditor.map((x) => x).toList(),
        'bookAuthor': bookAuthor.map((x) => x).toList(),
      };
}

class GroupBookTable {
  const GroupBookTable({
    required this.id,
    this.name,
    required this.bookTables,
  });

  factory GroupBookTable.fromJson(Map<String, dynamic> json) {
    return GroupBookTable(
      id: json['id'],
      name: json['name'],
      bookTables: List<BookTable>.from(
        ((json['bookTables'] ?? <BookTable>[]) as List)
            .map((e) => BookTable.fromJson(e)),
      ),
    );
  }

  final int id;
  final String? name;
  final List<BookTable> bookTables;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bookTables': bookTables.map((e) => e.toJson()).toList(),
    };
  }
}

class BookTable {
  const BookTable({
    required this.id,
    required this.title,
    this.content,
    this.numPage,
  });

  factory BookTable.fromJson(Map<String, dynamic> json) {
    return BookTable(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      numPage: json['numPage'],
    );
  }

  final int id;
  final String title;
  final String? content;
  final int? numPage;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'numPage': numPage,
    };
  }
}

class Class {
  const Class({
    required this.id,
    required this.name,
    required this.books,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      name: json['name'],
      books: List<Book>.from(
        json['books'].map((x) => Book.fromJson(x)),
      ),
    );
  }

  final int id;
  final String name;
  final List<Book> books;

  Class copyWith({
    int? id,
    String? name,
    List<Book>? books,
  }) =>
      Class(
        id: id ?? this.id,
        name: name ?? this.name,
        books: books ?? this.books,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'books': List<dynamic>.from(books.map((x) => x.toJson())),
    };
  }
}

class BookPublisher {
  const BookPublisher({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
    required this.listClass,
  });

  factory BookPublisher.fromJson(Map<String, dynamic> json) {
    return BookPublisher(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      color: json['color'],
      listClass: List<Class>.from(
        json['listClass'].map((x) => Class.fromJson(x)),
      ),
    );
  }

  final int id;
  final String name;
  final String image;
  final String color;
  final List<Class> listClass;

  BookPublisher copyWith({
    int? id,
    String? name,
    String? image,
    String? color,
    List<Class>? listClass,
  }) =>
      BookPublisher(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        color: color ?? this.color,
        listClass: listClass ?? this.listClass,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'color': color,
      'listClass': List<dynamic>.from(listClass.map((x) => x.toJson())),
    };
  }
}

List<BookPublisher> listBookPublisherFromJson(
  List<Map<String, dynamic>> jsonList,
) {
  return jsonList.map((json) => BookPublisher.fromJson(json)).toList();
}

List<Map<String, dynamic>> listBookPublisherToJson(
  List<BookPublisher> bookPublishers,
) {
  return bookPublishers.map((bookPublisher) => bookPublisher.toJson()).toList();
}

class BookPublisherData {
  static List<BookPublisher> listBookPublisher = [];

  static Future<String> downloadFile(
    String url, {
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final namesFile = url.split('/');
      final length = namesFile.length;
      final appDir = await getApplicationDocumentsDirectory();
      final pdfFile = File(
        '${appDir.path}/${namesFile[length - 5]}/${namesFile[length - 4]}/${namesFile[length - 3]}/${namesFile[length - 2]}/${namesFile[length - 1]}',
      );
      await Dio()
          .download(url, pdfFile.path, onReceiveProgress: onReceiveProgress);
      return pdfFile.path;
    } catch (_) {}
    return url;
  }
}
