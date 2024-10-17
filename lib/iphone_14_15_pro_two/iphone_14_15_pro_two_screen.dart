import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'iphone_14_15_pro_two_bloc.dart';
import '/iphone_homepage/iphone_home_screen.dart';


class Iphone1415ProTwoScreen extends StatelessWidget {
  const Iphone1415ProTwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1415ProTwoBloc>(
      create: (context) => Iphone1415ProTwoBloc(Iphone1415ProTwoState(
        iphone1415ProTwoModelObj: Iphone1415ProTwoModel(),
      ))
        ..add(Iphone1415ProTwoInitialEvent()),
      child: Iphone1415ProTwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Iphone1415ProTwoBloc, Iphone1415ProTwoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(context),
            body: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.23, -0.04),
                  end: Alignment(-0.19, 1.13),
                  colors: [
                    Color(0XFFF0F5FA),
                    Color(0XCC0D2442),
                    Color(0XFF3976C7)
                  ],
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 56),
                padding: EdgeInsets.only(
                  left: 26,
                  top: 8,
                  right: 26,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildChineseSection(context),
                    SizedBox(height: 16),
                    _buildKoreanSection(context)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 56,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left part: Back button with text and icon
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IphoneHomeScreen.builder(context),
              ),
            );
          },
          icon: SvgPicture.asset(
            "assets/images/img_arrow_left.svg",
            height: 14,
            width: 14,
          ),
          label: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Back",
              style: TextStyle(
                color: Color(0XFF5F6369),
                fontSize: 15,
                fontFamily: 'Google Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16), // 增大左右點擊範圍
          ),
        ),
        // Middle part: Google Pun (centered)
        Expanded(
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "G",
                    style: TextStyle(
                      color: Color(0XFF1C73E8),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "o",
                    style: TextStyle(
                      color: Color(0XFFEA4336),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "o",
                    style: TextStyle(
                      color: Color(0XFFFABD05),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "g",
                    style: TextStyle(
                      color: Color(0XFF386BF6),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "l",
                    style: TextStyle(
                      color: Color(0XFF34A853),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "e",
                    style: TextStyle(
                      color: Color(0XFFEA4336),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                    text: "Pun",
                    style: TextStyle(
                      color: Color(0XFF005AD4),
                      fontSize: 22.31,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Right part: empty to balance layout
        SizedBox(width: 40), // Placeholder for symmetry
      ],
    ),
  );
}

  /// Section Widget
  Widget _buildChineseSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        left: 24,
        top: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chinese (Traditional)",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 11,
              fontFamily: 'Google Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "夏天",
            style: TextStyle(
              color: Color(0XFF5F6369),
              fontSize: 24.095813751220703,
              fontFamily: 'Google Sans',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildKoreanSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Text(
                  "Korean",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 11,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "여름",
                  style: TextStyle(
                    color: Color(0XFF5F6369),
                    fontSize: 24.095813751220703,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "yeo reum",
                  style: TextStyle(
                    color: Color(0XFF5F6369),
                    fontSize: 13,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 28),
                Image.asset(
                  "assets/images/img_logo.png",
                  height: 20,
                  width: 24,
                ),
                SizedBox(height: 6),
                Text(
                  "有熱嗎？",
                  style: TextStyle(
                    color: Color(0XFF005AD4),
                    fontSize: 26,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "可以聯想成「有熱嗎」，因為夏天通常天氣炎熱。這樣透過「有熱嗎」的諧音，你就比較容易記住「여름」這個發音了。",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0XFF005AD4),
                    fontSize: 14,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Pun in Chinese (Traditional)",
                  style: TextStyle(
                    color: Color(0XFF005AD4),
                    fontSize: 11,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(
              left: 4,
              right: 2,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(1.26, -3.3),
                        end: Alignment(0, 1.34),
                        colors: [
                          Color(0XFF3781E4),
                          Color(0XFFC3DDFF),
                          Color(0XFFFFFFFF)
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Image.asset(
                              "assets/images/img_vector_14x14.png",
                              height: 14,
                              width: 14,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Save",
                            style: TextStyle(
                              color: Color(0XFF005AD4),
                              fontSize: 14.041421890258789,
                              fontFamily: 'Google Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(0.83, -1.59),
                        end: Alignment(0, 1),
                        colors: [
                          Color(0XFF005AD4),
                          Color(0XFF3781E4),
                          Color(0XFF569EFF)
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            child: SvgPicture.asset(
                              "assets/images/img_shuffle24dp5f6368fill0wght400grad0opsz24_1.svg",
                              height: 16,
                              width: 16,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "Regenerate",
                            style: TextStyle(
                              color: Color(0XFFF0F5FA),
                              fontSize: 14.041421890258789,
                              fontFamily: 'Google Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
