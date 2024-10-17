import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'iphone_flashcards_bloc.dart';
// dfjajd;lfdsjflsd;
class IphoneFlashcardsScreen extends StatelessWidget {
  const IphoneFlashcardsScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<IphoneFlashcardsBloc>(
      create: (context) => IphoneFlashcardsBloc(IphoneFlashcardsState(
        iphoneFlashcardsModelObj: IphoneFlashcardsModel(),
      ))
        ..add(IphoneFlashcardsInitialEvent()),
      child: const IphoneFlashcardsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavigationSection(context),
                  const Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Text(
                      "Ready for a quiz?",
                      style: TextStyle(
                        color: Color(0XFF333333),
                        fontSize: 24.095813751220703,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildQuizPreparationSection(context),
                  const SizedBox(height: 28),
                  const Padding(
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
                  const SizedBox(height: 10),
                  _buildRecentlyAddedList(context),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.maxFinite,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                        gradient: const LinearGradient(
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
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text(
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
                  const SizedBox(height: 16)
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
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: Color(0XCCFFFFFF),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 54),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: 14,
                    width: 14,
                    child: SvgPicture.asset(
                      "assets/images/img_arrow_left_14x14.svg",
                    ),
                  ),
                ),
                const Padding(
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
                )
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Flashcards",
                  style: TextStyle(
                    color: Color(0XFF005AD4),
                    fontSize: 36,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    "assets/images/img_content_copy_24.png",
                    height: 38,
                    width: 40,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildQuizPreparationSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 34),
      child: BlocSelector<IphoneFlashcardsBloc, IphoneFlashcardsState,
          IphoneFlashcardsModel?>(
        selector: (state) => state.iphoneFlashcardsModelObj,
        builder: (context, iphoneFlashcardsModelObj) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 26,
              children: List.generate(
                iphoneFlashcardsModelObj
                        ?.quizpreparationsectionItemList.length ??
                    0,
                (index) {
                  QuizpreparationsectionItemModel model =
                      iphoneFlashcardsModelObj
                              ?.quizpreparationsectionItemList[index] ??
                          QuizpreparationsectionItemModel();
                  return QuizpreparationsectionItemWidget(
                    model,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentlyAddedList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: BlocSelector<IphoneFlashcardsBloc, IphoneFlashcardsState,
          IphoneFlashcardsModel?>(
        selector: (state) => state.iphoneFlashcardsModelObj,
        builder: (context, iphoneFlashcardsModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(
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
class QuizpreparationsectionItemWidget extends StatelessWidget {
  QuizpreparationsectionItemWidget(this.quizpreparationsectionItemModelObj,
      {super.key});

  QuizpreparationsectionItemModel quizpreparationsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 166,
      decoration: BoxDecoration(
        color: const Color(0XFFD9D9D9),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class RecentlyaddedlistItemWidget extends StatelessWidget {
  RecentlyaddedlistItemWidget(this.recentlyaddedlistItemModelObj, {super.key});

  RecentlyaddedlistItemModel recentlyaddedlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: const Color(0XFFF5F5F5),
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
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12,
        ),
        title: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recentlyaddedlistItemModelObj.dinosaur!,
                  style: const TextStyle(
                    color: Color(0XFF5F6369),
                    fontSize: 24.095813751220703,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: const TextSpan(
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
