import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'iphone_daily_pun_screen.dart';

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
  IphoneDailyPunModel({this.gridbasicItemList = const []});

  List<GridbasicItemModel> gridbasicItemList;

  IphoneDailyPunModel copyWith({List<GridbasicItemModel>? gridbasicItemList}) {
    return IphoneDailyPunModel(
      gridbasicItemList: gridbasicItemList ?? this.gridbasicItemList,
    );
  }

  @override
  List<Object?> get props => [gridbasicItemList];
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
          gridbasicItemList: fillGridbasicItemList(),
        ),
      ),
    );
  }

  List<GridbasicItemModel> fillGridbasicItemList() {
    return [
      GridbasicItemModel(
          basicEnglish: "assets/images/img_vector_20x26.svg",
          basicenglish1: "Basic English"),
      GridbasicItemModel(
          basicEnglish: "assets/images/img_vector_18x18.svg",
          basicenglish1: "Plants"),
      GridbasicItemModel(
          basicEnglish: "assets/images/img_vector_20x14.svg",
          basicenglish1: "Travel"),
      GridbasicItemModel(basicenglish1: "Basic Chinese"),
      GridbasicItemModel(basicenglish1: "Basic Swedish"),
      GridbasicItemModel()
    ];
  }
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
