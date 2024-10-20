import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/database_helper.dart';
import 'iphone_daily_pun_bloc.dart';
import '/iphone_homepage/iphone_home_screen.dart';
import 'package:myapp/global_variables.dart' as global;


class IphoneDailyPunScreen extends StatelessWidget {
  const IphoneDailyPunScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<IphoneDailyPunBloc>(
      create: (context) => IphoneDailyPunBloc(IphoneDailyPunState(
        iphoneDailyPunModelObj: IphoneDailyPunModel(),
      ))
        ..add(IphoneDailyPunInitialEvent()),
      child: IphoneDailyPunScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDailyPunSection(context),
                SizedBox(height: 18),
                _buildTranslationSection(context),
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Text(
                    "Daily Pun History",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  /// Section Widget
  Widget _buildDailyPunSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 34,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            SizedBox(height: 26),
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
          SizedBox(height: 8),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Daily pun",
                    style: TextStyle(
                      color: Color(0XFF005AD4),
                      fontSize: 36,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    "assets/images/img_vector.png",
                    height: 28,
                    width: 32,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  List<String> partitionResponse(String response) {
    // Split the response by the delimiter
    return response.split('/').map((s) => s.trim()).toList();
  }

  /// Section Widget
Widget _buildTranslationSection(BuildContext context) {
  String aiResponse = global.dailypun; // Assuming this holds the AI response

  // Partition the response
  List<String> parts = partitionResponse(aiResponse);
  
  return Container(
    width: double.maxFinite,
    margin: EdgeInsets.symmetric(horizontal: 26),
    padding: EdgeInsets.symmetric(
      horizontal: 4,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      color: Color(0XFFF5F5F5),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: RichText(
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
                      TextSpan(
                        text: global.punLanguage,
                        style: TextStyle(
                          color: Color(0XFF005AD4),
                          fontSize: 11,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // 创建一个新的 RecentlyaddedlistItemModel 实例，或直接使用现有实例
                  RecentlyaddedlistItemModel itemToSave = RecentlyaddedlistItemModel(
                    dinosaur: global.otherlanguage,
                    englishWord: global.translation,
                    pun: global.pun,
                    
                  );

                  // 调用保存单字的方法
                  DatabaseHelper dbHelper = DatabaseHelper();
                  Map<String, dynamic> dataToSave = {
                    'chinese_word': itemToSave.dinosaur,
                    'english_word': itemToSave.englishWord,
                    'pun': itemToSave.pun,
                    
                  };

                  // 将数据插入到 'dailypun_result' 表中
                  dbHelper.insertItem('dailypun_result', dataToSave);
                  
                  // 提示用户保存成功
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${itemToSave.dinosaur} saved!')),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: 44,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/images/img_starrr.svg",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            parts[0],
            style: TextStyle(
              color: Color(0XFF5F6369),
              fontSize: 24.1,
              fontFamily: 'Google Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            parts[1],
            style: TextStyle(
              color: Color(0XFF5F6369),
              fontSize: 13,
              fontFamily: 'Google Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 2),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            parts[2],
            style: TextStyle(
              color: Color(0XFF5F6369),
              fontSize: 26,
              fontFamily: 'Google Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ],
    ),
  );
}

}

  
  Widget _buildRecentlyAddedList(BuildContext context) {
    
    FlashcardsDeleter dbHelper = FlashcardsDeleter();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: BlocSelector<IphoneDailyPunBloc, IphoneDailyPunState, IphoneDailyPunModel?>(
        selector: (state) => state.iphoneDailyPunModelObj,
        builder: (context, iphoneDailyPunModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 12,
              );
            },
            itemCount: iphoneDailyPunModelObj?.recentlyaddedlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              RecentlyaddedlistItemModel model =
                  iphoneDailyPunModelObj?.recentlyaddedlistItemList[index] ??
                      RecentlyaddedlistItemModel();
              return RecentlyaddedlistItemWidget(
                model,
                onDelete: (id) async {
                  // 在这里处理删除逻辑
                  await dbHelper.deleteItem(int.parse(id));
                  // 可以在这里添加状态更新或其他操作
                },
              );
            },
          );
        },
      ),
    );
  }



// ignore_for_file: must_be_immutable
class RecentlyaddedlistItemWidget extends StatelessWidget {
  RecentlyaddedlistItemWidget(this.recentlyaddedlistItemModelObj, {Key? key, required this.onDelete})
      : super(
          key: key,
        );

  RecentlyaddedlistItemModel recentlyaddedlistItemModelObj;
  final Future<void> Function(String id) onDelete;

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