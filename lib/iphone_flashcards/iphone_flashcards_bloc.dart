import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'iphone_flashcards_screen.dart';
import 'package:myapp/database_helper.dart'; // 已經存在

/// This class defines the variables used in the [iphone_flashcards_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class IphoneFlashcardsModel extends Equatable {
  IphoneFlashcardsModel(
      {this.quizpreparationsectionItemList = const [],
      this.recentlyaddedlistItemList = const []});

  List<QuizpreparationsectionItemModel> quizpreparationsectionItemList;

  List<RecentlyaddedlistItemModel> recentlyaddedlistItemList;

  IphoneFlashcardsModel copyWith({
    List<QuizpreparationsectionItemModel>? quizpreparationsectionItemList,
    List<RecentlyaddedlistItemModel>? recentlyaddedlistItemList,
  }) {
    return IphoneFlashcardsModel(
      quizpreparationsectionItemList:
          quizpreparationsectionItemList ?? this.quizpreparationsectionItemList,
      recentlyaddedlistItemList:
          recentlyaddedlistItemList ?? this.recentlyaddedlistItemList,
    );
  }

  @override
  List<Object?> get props =>
      [quizpreparationsectionItemList, recentlyaddedlistItemList];
}

/// This class is used in the [quizpreparationsection_item_widget] screen.

// ignore_for_file: must_be_immutable
class QuizpreparationsectionItemModel extends Equatable {
  QuizpreparationsectionItemModel({this.id}) {
    id = id ?? "";
  }

  String? id;

  QuizpreparationsectionItemModel copyWith({String? id}) {
    return QuizpreparationsectionItemModel(
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id];
}

/// This class is used in the [recentlyaddedlist_item_widget] screen.

// ignore_for_file: must_be_immutable
class RecentlyaddedlistItemModel extends Equatable {
  RecentlyaddedlistItemModel({
    this.dinosaur,
    this.id,
    this.englishWord,
    this.pun,
  }) {
    dinosaur = dinosaur ?? "Empty";
    id = id ?? "";
    englishWord = englishWord ?? "";
    pun = pun ?? "";
  }

  String? dinosaur;
  String? id;
  String? englishWord; // 新增字段
  String? pun;         // 新增字段

  // 修改 copyWith 方法，加入 englishWord 和 pun 字段
  RecentlyaddedlistItemModel copyWith({
    String? dinosaur,
    String? id,
    String? englishWord,
    String? pun,
  }) {
    return RecentlyaddedlistItemModel(
      dinosaur: dinosaur ?? this.dinosaur,
      id: id ?? this.id,
      englishWord: englishWord ?? this.englishWord,
      pun: pun ?? this.pun,
    );
  }

  @override
  List<Object?> get props => [dinosaur, id, englishWord, pun]; // 更新 props
}

/// A bloc that manages the state of a IphoneFlashcards according to the event that is dispatched to it.
class IphoneFlashcardsBloc
    extends Bloc<IphoneFlashcardsEvent, IphoneFlashcardsState> {
  IphoneFlashcardsBloc(IphoneFlashcardsState initialState)
      : super(initialState) {
    on<IphoneFlashcardsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IphoneFlashcardsInitialEvent event,
    Emitter<IphoneFlashcardsState> emit,
  ) async {
    emit(
      state.copyWith(
        iphoneFlashcardsModelObj: state.iphoneFlashcardsModelObj?.copyWith(
          quizpreparationsectionItemList: fillQuizpreparationsectionItemList(),
          recentlyaddedlistItemList: await fillRecentlyaddedlistItemList(), // 修改
        ),
      ),
    );
  }

  List<QuizpreparationsectionItemModel> fillQuizpreparationsectionItemList() {
    return List.generate(3, (index) => QuizpreparationsectionItemModel());
  }

  Future<List<RecentlyaddedlistItemModel>> fillRecentlyaddedlistItemList() async {
    // 預設值為 "Empty"
    List<RecentlyaddedlistItemModel> recentlyAddedItems = [
      RecentlyaddedlistItemModel(dinosaur: "Empty", englishWord: "", pun: ""),
      RecentlyaddedlistItemModel(dinosaur: "Empty", englishWord: "", pun: ""),
      RecentlyaddedlistItemModel(dinosaur: "Empty", englishWord: "", pun: ""),
      RecentlyaddedlistItemModel(dinosaur: "Empty", englishWord: "", pun: ""),
      RecentlyaddedlistItemModel(dinosaur: "Empty", englishWord: "", pun: "")
    ];

    DatabaseHelper dbHelper = DatabaseHelper();

    // 從資料庫中查詢最近的五筆資料
    List<Map<String, dynamic>> data = await dbHelper.getItems('user_words');

    if (data.isNotEmpty) {
      // 確保最多只取 5 筆資料
      for (var i = 0; i < (data.length > 5 ? 5 : data.length); i++) {
        recentlyAddedItems[i] = RecentlyaddedlistItemModel(
          dinosaur: data[i]['chinese_word'],   // 從 'chinese_word' 字段取值
          englishWord: data[i]['english_word'], // 從 'english_word' 字段取值
          pun: data[i]['pun'],                 // 從 'pun' 字段取值
          id: data[i]['id'].toString(),
        );
      }
    }

    return recentlyAddedItems;
  }
}

/// Represents the state of IphoneFlashcards in the application.

// ignore_for_file: must_be_immutable
class IphoneFlashcardsState extends Equatable {
  IphoneFlashcardsState({this.iphoneFlashcardsModelObj});

  IphoneFlashcardsModel? iphoneFlashcardsModelObj;

  @override
  List<Object?> get props => [iphoneFlashcardsModelObj];
  IphoneFlashcardsState copyWith(
      {IphoneFlashcardsModel? iphoneFlashcardsModelObj}) {
    return IphoneFlashcardsState(
      iphoneFlashcardsModelObj:
          iphoneFlashcardsModelObj ?? this.iphoneFlashcardsModelObj,
    );
  }
}

/// Abstract class for all events that can be dispatched from the
///IphoneFlashcards widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class IphoneFlashcardsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the IphoneFlashcards widget is first created.
class IphoneFlashcardsInitialEvent extends IphoneFlashcardsEvent {
  @override
  List<Object?> get props => [];
}