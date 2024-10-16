import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: must_be_immutable
class IphoneHomeScreen extends StatefulWidget {
  IphoneHomeScreen({Key? key}) : super(key: key);

  @override
  _IphoneHomeScreenState createState() => _IphoneHomeScreenState();
}

class DailyPunSection extends StatefulWidget {
  @override
  _DailyPunSectionState createState() => _DailyPunSectionState();
}


class _DailyPunSectionState extends State<DailyPunSection> {
  bool _isFirstText = true;

  void _toggleText() {
    setState(() {
      _isFirstText = !_isFirstText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleText,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment(0.62, -0.43),
            end: Alignment(0.08, 1.6),
            colors: _isFirstText
                ? [Color(0XFF005AD4), Color(0XFF4991F3), Color(0XFF569EFF)]
                : [Color(0XFF589DFB), Color(0XFFB0E0E6), Color(0XFFF2F7FD)], // Updated colors
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
                  _isFirstText ? 'Daily pun just for you!' : 'Daily pun just for you!',
                  style: TextStyle(
                    color: _isFirstText ? Color(0XFFF2F7FD) : Color(0XFF3781E4) ,
                    fontSize: 24.095813751220703,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 28),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
              "assets/images/stars.svg",
              colorFilter: ColorFilter.mode(
                Color(0XFF589DFB).withOpacity(0.8), // Adjust opacity as needed
                BlendMode.srcIn,
              ),
              height: 28,
              width: 28,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class DailyPun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DailyPunSection(),
      ],
    );
  }
}



class _IphoneHomeScreenState extends State<IphoneHomeScreen> {
  TextEditingController frame2017oneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  String? _selectedLanguage;

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
                                padding: EdgeInsets.all(0), // Add the required padding argument
                                child: SvgPicture.asset(
                                  "assets/images/Vector.svg",
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
                DailyPun(),
                SizedBox(height: 22),
                SizedBox(
                  width: 338,
                  child: TextFormField(
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
                        onPressed: () {},
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
                          Padding(
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
  Widget _buildLanguageSelectionSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
SizedBox(
            width: 140,
            child: Stack(
              children: [
                DropdownButtonFormField<String>(
                  focusNode: FocusNode(),
                  autofocus: true,
                  style: TextStyle(
                    color: Color(0XFF666666),
                    fontSize: 10.441558837890625,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                  items: dropdownItemList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textAlign: TextAlign.left,
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0XFFFFFFFF),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12, // Adjust vertical padding to center text
                    ),
                  ),
                ),
                if (_selectedLanguage == null)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Language",
                        style: TextStyle(
                          color: Color(0XFF666666),
                          fontSize: 10.441558837890625,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 140,
            child: Stack(
              children: [
                DropdownButtonFormField<String>(
                  focusNode: FocusNode(),
                  autofocus: true,
                  style: TextStyle(
                    color: Color(0XFF666666),
                    fontSize: 10.441558837890625,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                  items: dropdownItemList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textAlign: TextAlign.left,
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0XFFFFFFFF),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12, // Adjust vertical padding to center text
                    ),
                  ),
                ),
                if (_selectedLanguage == null)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Language",
                        style: TextStyle(
                          color: Color(0XFF666666),
                          fontSize: 10.441558837890625,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
],
      ),
    );
  }
}



