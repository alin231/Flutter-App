import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      child: Text(
                        "Show all results",
                        style: TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 14,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w400,
                        ),
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
        borderRadius: BorderRadius.circular(
          8,
        ),
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
                          text: "English  →  ",
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 11,
                            fontFamily: 'Google Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Chinese (Traditional)",
                          style: TextStyle(
                            color: Color(0XFF005AD4),
                            fontSize: 11,
                            fontFamily: 'Google Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
BlocBuilder<IphoneDailyPunBloc, IphoneDailyPunState>(
  builder: (context, state) {
    return ListView.builder(
      itemCount: state.iphoneDailyPunModelObj?.recentlyaddedlistItemList.length ?? 0,
      itemBuilder: (context, index) {
        // Fetch the item from the list using the current index
        final item = state.iphoneDailyPunModelObj?.recentlyaddedlistItemList[index];

        // Ensure that the item is not null
        if (item == null) return Container();

        return IconButton(
          icon: BlocBuilder<IphoneDailyPunBloc, IphoneDailyPunState>(
            builder: (context, state) {
              // Check if the current item is starred
              final isStarFilled = state.iphoneDailyPunModelObj?.recentlyaddedlistItemList
            .firstWhere((element) => element.id == item.id)
            .dinosaur == "Starred";

              return SvgPicture.asset(
          isStarFilled
              ? "assets/images/img_star_filled.svg"
              : "assets/images/img_starrr.svg",
              );
            },
          ),
          onPressed: () {
            // Dispatch the ToggleStarEvent with the item's ID
            context.read<IphoneDailyPunBloc>().add(ToggleStarEvent(id: item.id!));
          },
        );
      },
    );
  },
)


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
                fontSize: 24.095813751220703,
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
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    parts[3],
                    style: TextStyle(
                      color: Color(0XFF005AD4),
                      fontSize: 16,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "powered by ",
                  style: TextStyle(
                    color: Color(0XFF5F6368),
                    fontSize: 10,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6,
                    top: 4,
                  ),
                  child: SizedBox(
                    height: 8,
                    width: 12,
                    child: SvgPicture.asset(
                      "assets/images/img_logo.svg",
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











  /// Section Widget
//   Widget _buildPunLibrariesSection(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.only(
//         left: 26,
//         right: 30,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Pun Libraries",
//             style: TextStyle(
//               color: Color(0XFF4B4F56),
//               fontSize: 24.095813751220703,
//               fontFamily: 'Google Sans',
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 18),
//           BlocSelector<IphoneDailyPunBloc, IphoneDailyPunState,
//               IphoneDailyPunModel?>(
//             selector: (state) => state.iphoneDailyPunModelObj,
//             builder: (context, iphoneDailyPunModelObj) {
//               return ResponsiveGridListBuilder(
//                 minItemWidth: 1,
//                 minItemsPerRow: 2,
//                 maxItemsPerRow: 2,
//                 horizontalGridSpacing: 14,
//                 verticalGridSpacing: 14,
//                 builder: (context, items) => ListView(
//                   shrinkWrap: true,
//                   padding: EdgeInsets.zero,
//                   physics: NeverScrollableScrollPhysics(),
//                   children: items,
//                 ),
//                 gridItems: List.generate(
//                   iphoneDailyPunModelObj?.gridbasicItemList.length ?? 0,
//                   (index) {
//                     GridbasicItemModel model =
//                         iphoneDailyPunModelObj?.gridbasicItemList[index] ??
//                             GridbasicItemModel();
//                     return GridbasicItemWidget(
//                       model,
//                     );
//                   },
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: must_be_immutable





// class GridbasicItemWidget extends StatelessWidget {
//   GridbasicItemWidget(this.gridbasicItemModelObj, {Key? key})
//       : super(
//           key: key,
//         );

//   GridbasicItemModel gridbasicItemModelObj;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.only(
//         left: 12,
//         top: 10,
//         bottom: 10,
//       ),
//       decoration: BoxDecoration(
//         color: Color(0XFFF5F5F5),
//         borderRadius: BorderRadius.circular(
//           6,
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 2),
//           SizedBox(
//             height: 20,
//             width: 28,
//             child: SvgPicture.asset(
//               gridbasicItemModelObj.basicEnglish!,
//             ),
//           ),
//           SizedBox(height: 26),
//           Text(
//             gridbasicItemModelObj.basicenglish1!,
//             style: TextStyle(
//               color: Color(0XFF333333),
//               fontSize: 14,
//               fontFamily: 'Google Sans',
//               fontWeight: FontWeight.w500,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
  /// Section Widget
  Widget _buildRecentlyAddedList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: BlocSelector<IphoneDailyPunBloc, IphoneDailyPunState,
          IphoneDailyPunModel?>(
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
            itemCount:
                iphoneDailyPunModelObj?.recentlyaddedlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              RecentlyaddedlistItemModel model =
                  iphoneDailyPunModelObj?.recentlyaddedlistItemList[index] ??
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


// ignore_for_file: must_be_immutable
class RecentlyaddedlistItemWidget extends StatelessWidget {
  RecentlyaddedlistItemWidget(this.recentlyaddedlistItemModelObj, {Key? key})
      : super(
          key: key,
        );

  RecentlyaddedlistItemModel recentlyaddedlistItemModelObj;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "English  →  ",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 11,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Chinese (Traditional)",
                      style: TextStyle(
                        color: Color(0XFF005AD4),
                        fontSize: 11,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        trailing: Padding(
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 44,
            width: 40,
            child: SvgPicture.asset(
              "assets/images/img_starrr.svg",
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
