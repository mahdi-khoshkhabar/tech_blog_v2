// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog_v2/controller/size_controller.dart';
import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/buttons.dart';
import 'package:tech_blog_v2/model/fake_data.dart';
import 'package:tech_blog_v2/model/tag_box.dart';
import 'package:tech_blog_v2/model/hashtag_gridview.dart';
import 'package:tech_blog_v2/model/items.dart';
import 'package:tech_blog_v2/model/tag_model.dart';
import 'package:tech_blog_v2/components/my_colors.dart';
import 'package:tech_blog_v2/components/my_string.dart';
import 'package:tech_blog_v2/themes.dart';

class CompleteInfoScreen extends StatefulWidget {
  const CompleteInfoScreen({super.key});

  @override
  State<CompleteInfoScreen> createState() => _CompleteInfoScreenState();
}

class _CompleteInfoScreenState extends State<CompleteInfoScreen> {
  List<TagModel> favoriteHashTagList = [];
  List<SelectableHashTagBox> selectableHashTagBoxList = [];
  RxList selectableFavoriteHashTagBoxList = RxList();

  @override
  void initState() {
    super.initState();
    // Initial hash tag box setup
    for (int index = 0; index < FakeData().hashTagStringList.length; index++) {
      selectableHashTagBoxList.add(SelectableHashTagBox(
        hashTagBox: BlackTagBox(
            tagModel: TagModel(
                title: FakeData().hashTagStringList[index], id: '$index')),
        hashTagBoxList: favoriteHashTagList,
        //TODO: add some function here to update favorite hash tags
        // onFavoriteToggle: ,
      ));
    }
  }

  // void _updateFavoriteHashTags() {
  //   setState(() {
  //     selectableFavoriteHashTagBoxList = favoriteHashTagList
  //         .map((hashTag) => SelectableHashTagBox(
  //               hashTagBox: HashTagBox(hashTagModel: hashTag),
  //               hashTagBoxList: favoriteHashTagList,
  //               onFavoriteToggle: _updateFavoriteHashTags,
  //             ))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController myTextEditingController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBody: false,
      // drawerEnableOpenDragGesture: false,
      // endDrawerEnableOpenDragGesture: false,
      // extendBodyBehindAppBar: false,
      // primary: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: SolidColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: size.height / 12,
          ),
          // tch bot
          Padding(
            padding: EdgeInsets.fromLTRB(SizeController(context).screenPadding,
                0, SizeController(context).screenPadding, 0),
            child: Center(
              child: SvgPicture.asset(
                Assets.images.tcbot,
                width: SizeController(context).tcbotWidthSize,
              ),
            ),
          ),
          // guide text
          Padding(
            padding: EdgeInsets.only(
                left: SizeController(context).screenPadding,
                right: SizeController(context).screenPadding),
            child: const SizedBox(
              width: double.maxFinite,
              child: Text(
                MyStrings.successfulRegistration,
                style: TextStyle(
                    fontFamily: "dana",
                    fontSize: 16,
                    color: SolidColors.primaryTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // text field
          Padding(
            padding: EdgeInsets.only(
                left: SizeController(context).screenPadding * 2.46,
                right: SizeController(context).screenPadding * 2.46),
            child: TextField(
              controller: myTextEditingController,
              autocorrect: false,
              decoration: Themes()
                  .textFieldInputDecoration
                  .copyWith(hintText: "Name & Last name"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // choose text
          const Text(
            MyStrings.chooseCats,
            style: TextStyle(
                fontFamily: "dana",
                fontSize: 16,
                color: SolidColors.primaryTextColor),
          ),
          HashTagGridView(
            myList: selectableHashTagBoxList,
          ),
          // up and down arrow picture
          SvgPicture.asset(
            Assets.images.downUpArrowSvg,
            width: SizeController(context).downUpArrowWidthSize,
          ),
          // favorite hashtag bar
          ItemBar(
            itemBarObjectList: selectableFavoriteHashTagBoxList,
            voidCallback: () {},
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 50),
            child: MyPurpleButton(
                inputString: MyStrings.continuation, function: () {}),
          ),
        ],
      ),
    );
  }
}
