import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'iphone_14_15_pro_two_bloc.dart';
import '/iphone_homepage/iphone_home_screen.dart';
import 'package:myapp/global_variables.dart' as global;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:io';
import 'package:myapp/database_helper.dart';


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
    // Access the global variable for the prompt
    //String prompt = global.norminput;

    // // Generate AI response
    // String aiResponse = generateAIResponse(prompt);

    // // Store the AI response in another global variable
    // global.normresponse = aiResponse;

    return BlocBuilder<Iphone1415ProTwoBloc, Iphone1415ProTwoState>(
      builder: (context, state) {
        // return SafeArea(
        //   child: Scaffold(
        //     extendBody: true,
        //     extendBodyBehindAppBar: true,
        //     appBar: _buildAppBar(context),
        //     body: Container(
        //       width: double.maxFinite,
        //       height: MediaQuery.of(context).size.height,
        //       decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //           begin: Alignment(1.23, -0.04),
        //           end: Alignment(-0.19, 1.13),
        //           colors: [
        //             Color(0XFFF0F5FA),
        //             Color(0XCC0D2442),
        //             Color(0XFF3976C7)
        //           ],
        //         ),
        //       ),
        //       child: Container(
        //         margin: EdgeInsets.only(top: 56),
        //         padding: EdgeInsets.only(
        //           left: 26,
        //           top: 8,
        //           right: 26,
        //         ),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.max,
        //           children: [
        //             _buildChineseSection(context),
        //             SizedBox(height: 16),
        //             _buildKoreanSection(context)
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // );
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
                child: FutureBuilder<String>(
                  future: generateAIResponse(global.norminput), // Call the async function
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator()); // Show loading indicator
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}")); // Show error message
                    } else if (snapshot.hasData) {
                      // Store the AI response in a global variable
                      global.normresponse = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _buildChineseSection(context),
                          SizedBox(height: 16),
                          _buildKoreanSection(context),
                          SizedBox(height: 16),
                          Text(
                            "AI Response: ${global.normresponse}", // Display AI response
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text("No data received.")); // Handle empty case
                    }
                  },
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
  Future<String> generateAIResponse(String prompt) async {
    final apiKey = global.apiKey;
    if (apiKey == null) {
      stderr.writeln(r'No $GEMINI_API_KEY environment variable');
      exit(1);
    }
    final model = GenerativeModel(
        model: global.tunedModel,
        apiKey: apiKey,
        safetySettings: [
          //SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.high)
        ],
        generationConfig: GenerationConfig(maxOutputTokens: 200));
    //print('Prompt: $prompt');
    //i want to make the content put into gemini be "幫我用"+prompt+"這個單字的中文諧音，輸出為:英文單字/中文意思/諧音/諧音/解釋"
        String formattedPrompt = "幫我用諧音成中文的方式記憶外文單字:$prompt。先取得該單字的羅馬拼音， 分解音節，接著在生成貼近羅馬拼音的中文諧音的過程中，嚴格將各音節對照注音聲母，r舉例對照:ch對應ㄑ不要對應到ㄎ、f對應ㄈ、w對應ㄨ等。確保念起來相似。並盡可能產出與該單字的意思有相關性的諧音。舉例:dinosaur的諧音 是呆腦獸，恐龍就是一種呆腦獸。如果無法產出直接與意思相關的諧音，請產出符合常理、可形成通順語句的諧音，不一定要是連在一起的語詞，也可以是幾個擴寫後可加入該單字中文意思形成通順語句的字。注意該句子裡需要出現單字中文意思以及諧音的那幾個字。舉例:adress的諧音是兒醉死，兒子醉死了忘記地址。諧音不可以直接假設是隨機人名 ，除非是專有名詞。最後幫我嚴格依照格式輸出，輸出為:外文意思/中文意思/諧音/解釋";
        //add more to prompt like examples
        
        print('Prompt: $formattedPrompt');
        
        // Generate content using the formatted prompt
        final response = await model.generateContent([Content.text(formattedPrompt)]);
        
        print('Response:');
        print(response.text);
        
        return response.text.toString();  // Return the actual response text
        }

  /// Section Widget
  // Widget _buildChineseSection(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     padding: EdgeInsets.only(
  //       left: 24,
  //       top: 24,
  //       bottom: 24,
  //     ),
  //     decoration: BoxDecoration(
  //       color: Color(0XFFFFFFFF),
  //       borderRadius: BorderRadius.circular(
  //         8,
  //       ),
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "Chinese (Traditional)",
  //           style: TextStyle(
  //             color: Color(0XFF000000),
  //             fontSize: 11,
  //             fontFamily: 'Google Sans',
  //             fontWeight: FontWeight.w400,
  //           ),
  //         ),
  //         SizedBox(height: 16),
  //         Text(
  //           "夏天",
  //           style: TextStyle(
  //             color: Color(0XFF5F6369),
  //             fontSize: 24.095813751220703,
  //             fontFamily: 'Google Sans',
  //             fontWeight: FontWeight.w400,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  // Function to partition the response string
  List<String> partitionResponse(String response) {
    // Split the response by the delimiter
    return response.split('/').map((s) => s.trim()).toList();
  }
  Widget _buildChineseSection(BuildContext context) {
  // Access the global variable for the AI response
  String aiResponse = global.normresponse; // Assuming this holds the AI response
  String showPunLanguage = global.punLanguage;
  // Partition the response
  List<String> parts = partitionResponse(aiResponse);

  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.only(
      left: 24,
      top: 24,
      bottom: 24,
    ),
    decoration: BoxDecoration(
      color: Color(0XFFFFFFFF),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showPunLanguage.isNotEmpty ? showPunLanguage : "",
          style: TextStyle(
            color: Color(0XFF000000),
            fontSize: 11,
            fontFamily: 'Google Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16),
        // Display part[0] for Chinese
        Text(
          parts.isNotEmpty ? parts[1] : "", // English word
          style: TextStyle(
            color: Color(0XFF5F6369),
            fontSize: 24,
            fontFamily: 'Google Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

  // /// Section Widget
  Widget _buildKoreanSection(BuildContext context) {
    String aiResponse = global.normresponse; // Assuming this holds the AI response
    String showTargetLanguage = global.targetLanguage;
    // Partition the response
    List<String> parts = partitionResponse(aiResponse);
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
                  showTargetLanguage.isNotEmpty ? showTargetLanguage : "",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 11,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  parts[0],
                  style: TextStyle(
                    color: Color(0XFF5F6369),
                    fontSize: 24.095813751220703,
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
                  parts[2],
                  style: TextStyle(
                    color: Color(0XFF005AD4),
                    fontSize: 26,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  parts[3],
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
                      onPressed: () async  {
                        global.otherlanguage = parts[0];
                        global.translation = parts[1];
                        global.pun = parts[2];
                        global.pun = parts[3];
                        // Save the pun to the database
                        // 實例化 DatabaseHelper
                        final dbHelper = DatabaseHelper();

                        // 調用 insertItem 方法並插入資料
                        await dbHelper.insertItem('user_words', {
                          'chinese_word': global.otherlanguage,  // 對應資料庫中的字段
                          'english_word': global.translation,   // 對應資料庫中的字段
                          'pun': global.pun,                    // 對應資料庫中的字段
                          'definition': global.pundef           // 對應資料庫中的字段
                        });

                      },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Iphone1415ProTwoScreen.builder(context),
                          ),
                        );
                      },
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
