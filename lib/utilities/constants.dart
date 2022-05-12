import 'package:flutter/material.dart';

//  Colours
const kMainThemeColour = Colors.lightBlueAccent;
const kSecondaryThemeColour = Colors.white;


//  Dimensions
const kParentContainerPadding = EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0);
const kCircleAvatarRadius = 30.0;
const kListIconSize = 30.0;
const kIconAndTitleSpace = 10.0;
const kTitleTextFontSize = 50.0;
const kNumberOfTasksFontSize = 18.0;
const kBottomSheetTitleTextFontSize = 30.0;
const kBottomSheetTextFieldBorderWidth = 5.0;


//  Styles
const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: kSecondaryThemeColour,
  fontSize: kTitleTextFontSize,
);
const kNumberOfTasksTextStyle = TextStyle(
  color: kSecondaryThemeColour,
  fontSize: kNumberOfTasksFontSize,
);
const kBottomSheetTitleTextStyle = TextStyle(
  color: kMainThemeColour,
  fontSize: kBottomSheetTitleTextFontSize,
);
const kBottomSheetAddButtonTextStyle = TextStyle(
    fontSize: 20,
    color: kSecondaryThemeColour
);

const kBottomSheetTextFieldDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: kMainThemeColour,
      width: kBottomSheetTextFieldBorderWidth,
    ),
  ),
);
const kSecondaryContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  color: kSecondaryThemeColour,
);


//  Icons
const kListIcon = Icons.list;
const kFABIcon = Icons.add;

// Enums
enum Status {
  todo,
  done,
}
