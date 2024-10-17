import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pun_result_screen.dart';
// dfjajd;lfdsjflsd;
/// This class defines the variables used in the [iphone_14_15_pro_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone1415ProTwoModel extends Equatable {
  const Iphone1415ProTwoModel();

  Iphone1415ProTwoModel copyWith() {
    return const Iphone1415ProTwoModel();
  }

  @override
  List<Object?> get props => [];
}

/// A bloc that manages the state of a Iphone1415ProTwo according to the event that is dispatched to it.
class Iphone1415ProTwoBloc
    extends Bloc<Iphone1415ProTwoEvent, Iphone1415ProTwoState> {
  Iphone1415ProTwoBloc(super.initialState) {
    on<Iphone1415ProTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    Iphone1415ProTwoInitialEvent event,
    Emitter<Iphone1415ProTwoState> emit,
  ) async {}
}

/// Represents the state of Iphone1415ProTwo in the application.

// ignore_for_file: must_be_immutable
class Iphone1415ProTwoState extends Equatable {
  Iphone1415ProTwoState({this.iphone1415ProTwoModelObj});

  Iphone1415ProTwoModel? iphone1415ProTwoModelObj;

  @override
  List<Object?> get props => [iphone1415ProTwoModelObj];
  Iphone1415ProTwoState copyWith(
      {Iphone1415ProTwoModel? iphone1415ProTwoModelObj}) {
    return Iphone1415ProTwoState(
      iphone1415ProTwoModelObj:
          iphone1415ProTwoModelObj ?? this.iphone1415ProTwoModelObj,
    );
  }
}

/// Abstract class for all events that can be dispatched from the
///Iphone1415ProTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class Iphone1415ProTwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Iphone1415ProTwo widget is first created.
class Iphone1415ProTwoInitialEvent extends Iphone1415ProTwoEvent {
  @override
  List<Object?> get props => [];
}
