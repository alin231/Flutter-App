import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'iphone_home_screen.dart';
import 'package:myapp/global_variables.dart' as global;

// pun language don't have 1 after the variable name
/// This class defines the variables used in the [iphone_home_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class IphoneHomeModel extends Equatable {
  IphoneHomeModel(
      {this.dropdownItemList = const [], this.dropdownItemList1 = const []});

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  IphoneHomeModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
  }) {
    return IphoneHomeModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, dropdownItemList1];
}

/// A bloc that manages the state of a IphoneHome according to the event that is dispatched to it.
class IphoneHomeBloc extends Bloc<IphoneHomeEvent, IphoneHomeState> {
  IphoneHomeBloc(IphoneHomeState initialState) : super(initialState) {
    on<IphoneHomeInitialEvent>(_onInitialize);
    on<onSelected>(_onSelected);
    on<onSelected1>(_onSelected1);
  }

_onInitialize(
  IphoneHomeInitialEvent event,
  Emitter<IphoneHomeState> emit,
) async {
  // 初始化 TextEditingController
  emit(
    state.copyWith(
      frame2017oneController: TextEditingController(),
    ),
  );

  // 初始化下拉列表項目
  List<SelectionPopupModel> initialDropdownList = fillDropdownItemList();
  List<SelectionPopupModel> initialDropdownList1 = fillDropdownItemList1();

  // 將預設選中的項目設置到 global 變數
  global.punLanguage = initialDropdownList.firstWhere((item) => item.isSelected, orElse: () => initialDropdownList[0]).title;
  global.targetLanguage = initialDropdownList1.firstWhere((item) => item.isSelected, orElse: () => initialDropdownList1[0]).title;

  // 更新 Bloc 狀態
  emit(
    state.copyWith(
      iphoneHomeModelObj: state.iphoneHomeModelObj?.copyWith(
        dropdownItemList: initialDropdownList,
        dropdownItemList1: initialDropdownList1,
      ),
    ),
  );
}


  _onSelected(
    onSelected event,
    Emitter<IphoneHomeState> emit,
  ) {
    global.punLanguage = event.value.title;
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _onSelected1(
    onSelected1 event,
    Emitter<IphoneHomeState> emit,
  ) {
    global.targetLanguage = event.value.title;
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Chinese (Traditional)",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "English",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Korean",
      ),
      SelectionPopupModel(
        id: 4,
        title: "Japanese",
      ),
    ];
  }
// A value of type 'SelectionPopupModel' can't be assigned to a variable of type 'String'.
// Try changing the type of the variable, or casting the right-hand type to 'String'.dartinvalid_assignment
  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Chinese (Traditional)",
      ),
      SelectionPopupModel(
        id: 2,
        title: "English",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 3,
        title: "Korean",
      ),
      SelectionPopupModel(
        id: 4,
        title: "Japanese",
      ),
    ];
  }

}

/// Represents the state of IphoneHome in the application.

// ignore_for_file: must_be_immutable
class IphoneHomeState extends Equatable {
  IphoneHomeState(
      {this.frame2017oneController,
      this.selectedDropDownValue,
      this.selectedDropDownValue1,
      this.iphoneHomeModelObj});

  TextEditingController? frame2017oneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  IphoneHomeModel? iphoneHomeModelObj;

  @override
  List<Object?> get props => [
        frame2017oneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        iphoneHomeModelObj
      ];
  IphoneHomeState copyWith({
    TextEditingController? frame2017oneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    IphoneHomeModel? iphoneHomeModelObj,
  }) {
    return IphoneHomeState(
      frame2017oneController:
          frame2017oneController ?? this.frame2017oneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      iphoneHomeModelObj: iphoneHomeModelObj ?? this.iphoneHomeModelObj,
    );
  }
}

/// Abstract class for all events that can be dispatched from the
///IphoneHome widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class IphoneHomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the IphoneHome widget is first created.
class IphoneHomeInitialEvent extends IphoneHomeEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection

// ignore_for_file: must_be_immutable
class onSelected extends IphoneHomeEvent {
  onSelected({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [value];
}

///event for dropdown selection

// ignore_for_file: must_be_immutable
class onSelected1 extends IphoneHomeEvent {
  onSelected1({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [value];
}
