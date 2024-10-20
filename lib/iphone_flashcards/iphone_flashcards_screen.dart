import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'iphone_flashcards_bloc.dart';
import '/iphone_homepage/iphone_home_screen.dart';
import 'package:myapp/global_variables.dart' as global;

class IphoneFlashcardsScreen extends StatelessWidget {
  const IphoneFlashcardsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<IphoneFlashcardsBloc>(
      create: (context) => IphoneFlashcardsBloc(IphoneFlashcardsState(
        iphoneFlashcardsModelObj: IphoneFlashcardsModel(),
      ))
        ..add(IphoneFlashcardsInitialEvent()),
      child: IphoneFlashcardsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavigationSection(context),
                  
                  SizedBox(height: 28),
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Text(
                      "Recently Added",
                      style: TextStyle(
                        color: Color(0XFF333333),
                        fontSize: 24.095813751220703,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildRecentlyAddedList(context),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment(0.83, -1.59),
                          end: Alignment(0.07, 2.44),
                          colors: [
                            Color(0XFF005AD4),
                            Color(0XFF3781E4),
                            Color(0XFF569EFF)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNavigationSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 54),
            Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            ),
          SizedBox(height: 14),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Flashcards",
                  style: TextStyle(
                    color: Color(0XFF005AD4),
                    fontSize: 36,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Image.asset(
                    "assets/images/img_content_copy_24.png",
                    height: 38,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  
  /// Section Widget
  Widget _buildRecentlyAddedList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: BlocSelector<IphoneFlashcardsBloc, IphoneFlashcardsState,
          IphoneFlashcardsModel?>(
        selector: (state) => state.iphoneFlashcardsModelObj,
        builder: (context, iphoneFlashcardsModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 12,
              );
            },
            itemCount:
                iphoneFlashcardsModelObj?.recentlyaddedlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              RecentlyaddedlistItemModel model =
                  iphoneFlashcardsModelObj?.recentlyaddedlistItemList[index] ??
                      RecentlyaddedlistItemModel();
              return RecentlyaddedlistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}


// ignore_for_file: must_be_immutable
class RecentlyaddedlistItemWidget extends StatelessWidget {
  RecentlyaddedlistItemWidget(this.recentlyaddedlistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  RecentlyaddedlistItemModel recentlyaddedlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    FlashcardsDeleter dbHelper = FlashcardsDeleter();

    return Ink(
      decoration: BoxDecoration(
        color: Color(0XFFF5F5F5),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: ListTile(
        minVerticalPadding: 0,
        minTileHeight: 0,
        minLeadingWidth: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12,
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recentlyaddedlistItemModelObj.dinosaur!,
                style: TextStyle(
                  color: Color(0XFF5F6369),
                  fontSize: 24.095813751220703,
                  fontFamily: 'Google Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                recentlyaddedlistItemModelObj.englishWord!,
                style: TextStyle(
                  color: Color(0XFF5F6369),
                  fontSize: 24.095813751220703,
                  fontFamily: 'Google Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                recentlyaddedlistItemModelObj.pun!,
                style: TextStyle(
                  color: Color(0XFF3781E4),
                  fontSize: 16,
                  fontFamily: 'Google Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: global.targetLanguage + "  →  ",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 11,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: global.punLanguage,
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 11,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        trailing: Padding(
          padding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () async {
              // 點擊圖片後刪除字卡
              await dbHelper.deleteItem(int.parse(recentlyaddedlistItemModelObj.id!));
              // 此處可以根據需求刷新頁面或顯示提示
              print("Deleted card with ID: ${recentlyaddedlistItemModelObj.id}");
              // 提示用户保存成功
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${recentlyaddedlistItemModelObj.dinosaur} deleted!')),
              );
            },
            child: SizedBox(
              height: 44,
              width: 40,
              child: SvgPicture.asset(
                "assets/images/img_starrr.svg",
              ),
            ),
          ),
        ),
        onTap: () {
          // 這裡可以執行其他操作，如跳轉到詳細頁面
        },
      ),
    );
  }
}
