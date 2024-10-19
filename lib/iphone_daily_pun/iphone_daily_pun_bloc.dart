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
      {this.recentlyaddedlistItemList = const []});


  List<RecentlyaddedlistItemModel> recentlyaddedlistItemList;

  IphoneDailyPunModel copyWith({
    List<RecentlyaddedlistItemModel>? recentlyaddedlistItemList,
  }) {
    return IphoneDailyPunModel(
      recentlyaddedlistItemList:
          recentlyaddedlistItemList ?? this.recentlyaddedlistItemList,
    );
  }

  @override
  List<Object?> get props =>
      [recentlyaddedlistItemList];
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
          recentlyaddedlistItemList: await fillRecentlyaddedlistItemList(),
        ),
      ),
    );
  }



  Future<List<RecentlyaddedlistItemModel>> fillRecentlyaddedlistItemList() async {
    // 預設空的列表，準備存放所有的資料
    List<RecentlyaddedlistItemModel> recentlyAddedItems = [];

    DatabaseHelper dbHelper = DatabaseHelper();

    // 從資料庫中查詢所有的資料
    List<Map<String, dynamic>> data = await dbHelper.getItems('daily_pun');

    if (data.isNotEmpty) {
      // 迭代所有資料，將每一筆資料加入 recentlyAddedItems 列表
      for (var i = 0; i < data.length; i++) {
        recentlyAddedItems.add(
          RecentlyaddedlistItemModel(
            dinosaur: data[i]['chinese_word'],    // 從 'chinese_word' 字段取值
            englishWord: data[i]['english_word'], // 從 'english_word' 字段取值
            pun: data[i]['pun'],                  // 從 'pun' 字段取值
            id: data[i]['id'].toString(),
          ),
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

class FlashcardsDeleter {
  final DatabaseHelper dbHelper = DatabaseHelper();

  // 删除数据库中的字卡
  Future<void> deleteItem(int id) async {
    try {
      await dbHelper.deleteItem('daily_pun', id);
      print("Item with id $id deleted successfully.");
    } catch (e) {
      print("Error deleting item: $e");
    }
  }
}
