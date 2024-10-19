import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'iphone_daily_pun_screen.dart';
import 'package:myapp/database_helper.dart';

/// This class is used in the [gridbasic_item_widget] screen.

// ignore_for_file: must_be_immutable
class GridbasicItemModel extends Equatable {
  GridbasicItemModel({this.basicEnglish, this.basicenglish1, this.id}) {
    basicEnglish = basicEnglish ?? "assets/images/img_vector_20x26.svg";
    basicenglish1 = basicenglish1 ?? "Basic English";
    id = id ?? "";
  }

  String? basicEnglish;

  String? basicenglish1;

  String? id;

  GridbasicItemModel copyWith({
    String? basicEnglish,
    String? basicenglish1,
    String? id,
  }) {
    return GridbasicItemModel(
      basicEnglish: basicEnglish ?? this.basicEnglish,
      basicenglish1: basicenglish1 ?? this.basicenglish1,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [basicEnglish, basicenglish1, id];
}

/// This class defines the variables used in the [iphone_daily_pun_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class IphoneDailyPunModel extends Equatable {
    IphoneDailyPunModel(
      {this.quizpreparationsectionItemList = const [],
      this.recentlyaddedlistItemList = const []});

  List<QuizpreparationsectionItemModel> quizpreparationsectionItemList;

  List<RecentlyaddedlistItemModel> recentlyaddedlistItemList;

  IphoneDailyPunModel copyWith({
    List<QuizpreparationsectionItemModel>? quizpreparationsectionItemList,
    List<RecentlyaddedlistItemModel>? recentlyaddedlistItemList,
  }) {
    return IphoneDailyPunModel(
      quizpreparationsectionItemList:
          quizpreparationsectionItemList ?? this.quizpreparationsectionItemList,
      recentlyaddedlistItemList:
          recentlyaddedlistItemList ?? this.recentlyaddedlistItemList,
    );
  }

  @override
  List<Object?> get props =>
      [quizpreparationsectionItemList, recentlyaddedlistItemList];
  // IphoneDailyPunModel({this.gridbasicItemList = const []});

  // List<GridbasicItemModel> gridbasicItemList;

  // IphoneDailyPunModel copyWith({List<GridbasicItemModel>? gridbasicItemList}) {
  //   return IphoneDailyPunModel(
  //     gridbasicItemList: gridbasicItemList ?? this.gridbasicItemList,
  //   );
  // }

  // @override
  // List<Object?> get props => [gridbasicItemList];
}



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


/// A bloc that manages the state of a IphoneDailyPun according to the event that is dispatched to it.
class IphoneDailyPunBloc
    extends Bloc<IphoneDailyPunEvent, IphoneDailyPunState> {
  IphoneDailyPunBloc(IphoneDailyPunState initialState) : super(initialState) {
    on<IphoneDailyPunInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IphoneDailyPunInitialEvent event,
    Emitter<IphoneDailyPunState> emit,
  ) async {
    emit(
      state.copyWith(
        iphoneDailyPunModelObj: state.iphoneDailyPunModelObj?.copyWith(
          quizpreparationsectionItemList: fillQuizpreparationsectionItemList(),
          recentlyaddedlistItemList: await fillRecentlyaddedlistItemList(),
        ),
      ),
    );
  }

  List<QuizpreparationsectionItemModel> fillQuizpreparationsectionItemList() {
    return List.generate(3, (index) => QuizpreparationsectionItemModel());
  }

  // 修改的部分：從資料庫讀取資料，最多替換五個 Dinosaur 項目
  Future<List<RecentlyaddedlistItemModel>> fillRecentlyaddedlistItemList() async {
    // 預設值為 "Empty"
    List<RecentlyaddedlistItemModel> recentlyAddedItems = [
      RecentlyaddedlistItemModel(dinosaur: "Empty"),
      RecentlyaddedlistItemModel(dinosaur: "Empty"),
      RecentlyaddedlistItemModel(dinosaur: "Empty"),
      RecentlyaddedlistItemModel(dinosaur: "Empty"),
      RecentlyaddedlistItemModel(dinosaur: "Empty")
    ];

    DatabaseHelper dbHelper = DatabaseHelper();

    // 從資料庫中查詢最近的五筆資料
    List<Map<String, dynamic>> data = await dbHelper.getItems('dailypun_result');
  
    if (data.isNotEmpty) {
      // 確保最多只取 5 筆資料
      for (var i = 0; i < (data.length > 5 ? 5 : data.length); i++) {
        recentlyAddedItems[i] = RecentlyaddedlistItemModel(
          dinosaur: data[i]['chinese_word'], // 假設從資料庫的 'chinese_word' 字段中取值
          id: data[i]['id'].toString(),
        );
      }
    }
  
    return recentlyAddedItems;
  }
  // _onInitialize(
  //   IphoneDailyPunInitialEvent event,
  //   Emitter<IphoneDailyPunState> emit,
  // ) async {
  //   emit(
  //     state.copyWith(
  //       iphoneDailyPunModelObj: state.iphoneDailyPunModelObj?.copyWith(
  //         gridbasicItemList: fillGridbasicItemList(),
  //       ),
  //     ),
  //   );
  // }

  // List<GridbasicItemModel> fillGridbasicItemList() {
  //   return [
  //     GridbasicItemModel(
  //         basicEnglish: "assets/images/img_vector_20x26.svg",
  //         basicenglish1: "Basic English"),
  //     GridbasicItemModel(
  //         basicEnglish: "assets/images/img_vector_18x18.svg",
  //         basicenglish1: "Plants"),
  //     GridbasicItemModel(
  //         basicEnglish: "assets/images/img_vector_20x14.svg",
  //         basicenglish1: "Travel"),
  //     GridbasicItemModel(basicenglish1: "Basic Chinese"),
  //     GridbasicItemModel(basicenglish1: "Basic Swedish"),
  //     GridbasicItemModel()
  //   ];
  // }
}

/// Represents the state of IphoneDailyPun in the application.

// ignore_for_file: must_be_immutable
class IphoneDailyPunState extends Equatable {
  IphoneDailyPunState({this.iphoneDailyPunModelObj});

  IphoneDailyPunModel? iphoneDailyPunModelObj;

  @override
  List<Object?> get props => [iphoneDailyPunModelObj];
  IphoneDailyPunState copyWith({IphoneDailyPunModel? iphoneDailyPunModelObj}) {
    return IphoneDailyPunState(
      iphoneDailyPunModelObj:
          iphoneDailyPunModelObj ?? this.iphoneDailyPunModelObj,
    );
  }
}

/// Abstract class for all events that can be dispatched from the
///IphoneDailyPun widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class IphoneDailyPunEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the IphoneDailyPun widget is first created.
class IphoneDailyPunInitialEvent extends IphoneDailyPunEvent {
  @override
  List<Object?> get props => [];
}






class RecentlyaddedlistItemModel extends Equatable {
  RecentlyaddedlistItemModel({this.dinosaur, this.id}) {
    dinosaur = dinosaur ?? "Empty";
    id = id ?? "";
  }

  String? dinosaur;

  String? id;

  RecentlyaddedlistItemModel copyWith({
    String? dinosaur,
    String? id,
  }) {
    return RecentlyaddedlistItemModel(
      dinosaur: dinosaur ?? this.dinosaur,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [dinosaur, id];
}