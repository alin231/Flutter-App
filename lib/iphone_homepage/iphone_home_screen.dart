import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'iphone_home_bloc.dart';
import 'package:myapp/iphone_14_15_pro_two/iphone_14_15_pro_two_screen.dart';
import 'package:myapp/iphone_flashcards/iphone_flashcards_screen.dart';
import 'package:myapp/iphone_daily_pun/iphone_daily_pun_screen.dart';

///SelectionPopupModel is common model
///used for setting data into dropdowns

// ignore_for_file: must_be_immutable
class SelectionPopupModel {
  SelectionPopupModel(
      {this.id, required this.title, this.value, this.isSelected = false});

  int? id;

  String title;

  dynamic value;

  bool isSelected;
}

class IphoneHomeScreen extends StatelessWidget {
  const IphoneHomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<IphoneHomeBloc>(
      create: (context) => IphoneHomeBloc(IphoneHomeState(
        iphoneHomeModelObj: IphoneHomeModel(),
      ))
        ..add(IphoneHomeInitialEvent()),
      child: IphoneHomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.23, -0.04),
              end: Alignment(-0.19, 1.13),
              colors: [Color(0XFFF0F5FA), Color(0XCC0D2442), Color(0XFF3976C7)],
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 26,
              vertical: 72,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 4),
                SizedBox(
                  width: 134,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "G",
                              style: TextStyle(
                                color: Color(0XFF1C73E8),
                                fontSize: 22.31357765197754,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "o",
                              style: TextStyle(
                                color: Color(0XFFEA4336),
                                fontSize: 22.31357765197754,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "o",
                              style: TextStyle(
                                color: Color(0XFFFABD05),
                                fontSize: 22.31357765197754,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "g",
                              style: TextStyle(
                                color: Color(0XFF386BF6),
                                fontSize: 22.31357765197754,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "l",
                              style: TextStyle(
                                color: Color(0XFF34A853),
                                fontSize: 22.31357765197754,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "e",
                              style: TextStyle(
                                color: Color(0XFFEA4336),
                                fontSize: 22.31357765197754,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 32,
                        width: 54,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Image.asset(
                                  "assets/images/img_vector.png",
                                  height: 14,
                                  width: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: " ",
                                    ),
                                    TextSpan(
                                      text: "Pun",
                                      style: TextStyle(
                                        color: Color(0XFF005AD4),
                                        fontSize: 22.31357765197754,
                                        fontFamily: 'Google Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18),
                _buildDailyPunSection(context),
                SizedBox(height: 22),
                SizedBox(
                  width: 338,
                  child: BlocSelector<IphoneHomeBloc, IphoneHomeState,
                      TextEditingController?>(
                    selector: (state) => state.frame2017oneController,
                    builder: (context, frame2017oneController) {
                      return TextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: frame2017oneController,
                        style: TextStyle(
                          color: Color(0XFF5F6369),
                          fontSize: 24.095813751220703,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w400,
                        ),
                        textInputAction: TextInputAction.done,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Enter to create flashcard",
                          hintStyle: TextStyle(
                            color: Color(0XFF5F6369),
                            fontSize: 24.095813751220703,
                            fontFamily: 'Google Sans',
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0XFFFFFFFF),
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(24, 26, 24, 12),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 18),
                _buildLanguageSelectionSection(context),
                Spacer(),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    left: 24,
                    right: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 42,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                                right: 4,
                              ),
                              child: SizedBox(
                                height: 26,
                                width: double.maxFinite,
                                child: SvgPicture.asset(
                                  "assets/images/img_vector_26x28.svg",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Camera",
                              style: TextStyle(
                                color: Color(0XFFD8E3F1),
                                fontSize: 11,
                                fontFamily: 'Google Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Iphone1415ProTwoScreen.builder(context),
                            ),
                          );
                        },
                        constraints: BoxConstraints(
                          minHeight: 112,
                          minWidth: 112,
                        ),
                        padding: EdgeInsets.all(0),
                        icon: Container(
                          width: 112,
                          height: 112,
                          decoration: BoxDecoration(
                            color: Color(0XFFFFFFFF),
                            borderRadius: BorderRadius.circular(
                              56,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0X14000000),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(
                                  0,
                                  0,
                                ),
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(22),
                          child: Image.asset(
                            "assets/images/img_pun.png",
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IphoneFlashcardsScreen.builder(context),
                                ),
                              );
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(
                                left: 8,
                                right: 10,
                              ),
                              child: SizedBox(
                                height: 34,
                                width: 34,
                                child: SvgPicture.asset(
                                  "assets/images/img_content_copy_24.svg",
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            "Flashcards",
                            style: TextStyle(
                              color: Color(0XFFD8E3F1),
                              fontSize: 11,
                              fontFamily: 'Google Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDailyPunSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IphoneDailyPunScreen.builder(context),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          gradient: LinearGradient(
            begin: Alignment(0.62, -0.43),
            end: Alignment(0.08, 1.6),
            colors: [Color(0XFF005AD4), Color(0XFF4991F3), Color(0XFF569EFF)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  "Daily pun just for you!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24.1,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 28),
            Padding(
              padding: EdgeInsets.zero,
              child: Image.asset(
                "assets/images/img_vector.png",
                height: 28,
                width: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildLanguageSelectionSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocSelector<IphoneHomeBloc, IphoneHomeState, IphoneHomeModel?>(
            selector: (state) => state.iphoneHomeModelObj,
            builder: (context, iphoneHomeModelObj) {
              return SizedBox(
                width: 140,
                child: DropdownButtonFormField<SelectionPopupModel>(
                  focusNode: FocusNode(),
                  autofocus: true,
                  style: TextStyle(
                    color: Color(0XFF666666),
                    fontSize: 10.441558837890625,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (value) {
                    context
                        .read<IphoneHomeBloc>()
                        .add(onSelected(value: value!));
                  },
                  items: iphoneHomeModelObj?.dropdownItemList
                      .map((SelectionPopupModel item) {
                    return DropdownMenuItem<SelectionPopupModel>(
                      value: item,
                      child: Text(
                        item.title,
                        textAlign: TextAlign.left,
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: "Select Language",
                    hintStyle: TextStyle(
                      color: Color(0XFF666666),
                      fontSize: 10.441558837890625,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0XFFFFFFFF),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                  ),
                ),
              );
            },
          ),
          BlocSelector<IphoneHomeBloc, IphoneHomeState, IphoneHomeModel?>(
            selector: (state) => state.iphoneHomeModelObj,
            builder: (context, iphoneHomeModelObj) {
              return SizedBox(
                width: 140,
                child: DropdownButtonFormField<SelectionPopupModel>(
                  focusNode: FocusNode(),
                  autofocus: true,
                  style: TextStyle(
                    color: Color(0XFF666666),
                    fontSize: 10.441558837890625,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (value) {
                    context
                        .read<IphoneHomeBloc>()
                        .add(onSelected1(value: value!));
                  },
                  items: iphoneHomeModelObj?.dropdownItemList1
                      .map((SelectionPopupModel item) {
                    return DropdownMenuItem<SelectionPopupModel>(
                      value: item,
                      child: Text(
                        item.title,
                        textAlign: TextAlign.left,
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: "Select Language",
                    hintStyle: TextStyle(
                      color: Color(0XFF666666),
                      fontSize: 10.441558837890625,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0XFFFFFFFF),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}