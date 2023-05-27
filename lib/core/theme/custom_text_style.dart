import 'package:flutter/material.dart';
import '/core/utils/extensions.dart';

const LargeTextSize = 26.0;
const MediumTextSize = 20.0;
const BodyTextSize = 16.0;
const BodyMediumTextSize = 14.0;
const BodyMinTextSize = 12.0;
const SubtitleMinSize = 10.0;

TextStyle cardStyle(BuildContext context) => TextStyle(
    fontSize: BodyMediumTextSize.sp,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).primaryColor);

final largeTextStyle = TextStyle(
  fontSize: LargeTextSize.sp,
  fontWeight: FontWeight.bold,
);

final titleTextStyle = TextStyle(
  fontSize: MediumTextSize.sp,
  fontWeight: FontWeight.bold,
);

final headerStyle = TextStyle(
  fontSize: BodyTextSize.sp,
  fontWeight: FontWeight.bold,
);

final headerNormalStyle = TextStyle(
  fontSize: BodyTextSize.sp,
  fontWeight: FontWeight.w500,
);

final subtitleTextStyle = TextStyle(
  fontSize: BodyMinTextSize.sp,
  fontWeight: FontWeight.w500,
);

final detailTitleText = TextStyle(
  fontSize: BodyMinTextSize.sp,
  fontWeight: FontWeight.bold,
);

final detailText = TextStyle(
  fontSize: BodyMinTextSize.sp,
);

final minStyle = TextStyle(
  fontSize: SubtitleMinSize.sp,
  fontWeight: FontWeight.w400,
);

final minBoldStyle = TextStyle(
  fontSize: SubtitleMinSize.sp,
  fontWeight: FontWeight.bold,
);

final inputLabelStyle = TextStyle(
  fontSize: BodyMediumTextSize.sp,
  fontWeight: FontWeight.bold,
);
