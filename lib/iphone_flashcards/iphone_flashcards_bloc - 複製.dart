import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'iphone_flashcards_screen.dart';
import 'package:myapp/database_helper.dart';
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
          recentlyaddedlistItemList: fillRecentlyaddedlistItemList(),
        ),
      ),
    );
  }

  List<QuizpreparationsectionItemModel> fillQuizpreparationsectionItemList() {
    return List.generate(3, (index) => QuizpreparationsectionItemModel());
  }

  List<RecentlyaddedlistItemModel> fillRecentlyaddedlistItemList() {
    return [
      RecentlyaddedlistItemModel(dinosaur: "Dinosaur"),
      RecentlyaddedlistItemModel(dinosaur: "Dinosaur"),
      RecentlyaddedlistItemModel(dinosaur: "Dinosaur"),
      RecentlyaddedlistItemModel(dinosaur: "Dinosaur"),
      RecentlyaddedlistItemModel(dinosaur: "Dinosaur")
    ];
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
