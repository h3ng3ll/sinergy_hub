

import 'package:flutter/material.dart';

enum AppColors {

  black(Color(0xFF000000)),
  transparent(Color(0x00000000)),

  buttonBlue(Color(0xff2196F3)),
  darkOrchid(Color(0xff9C27B0)),
  apple(Color(0xff4CAF50)),
  eucalyptus(Color(0xff34D399)),
  royalBlue(Color(0xff316fe7)),
  lavenderFloral(Color(0xffbb7cfa)),
  telemagenta(Color(0xffcf3079)),
  hotPink(Color(0xffF26BB0)),
  seaGreen(Color(0xff1c9b4a)),
  uFOGreen(Color(0xff44d579)),
  metallicOrange(Color(0xffe25b11)),
  jasperOrange(Color(0xffea894c)),
  pinkLace(Color(0xfff6e5f6)),
  tartOrange(Color(0xfffc494a)),

  majorelleBlue(Color(0xff6E3EEA)),
  greenCrayola(Color(0xff0FBA81)),
  tropicalRainForest(Color(0xff047857)),
  antiFlashWhite(Color(0xffF3F4F6)),
  magnolia(Color(0xffF5F4FF)),
  ghostWhite(Color(0xffF9F9FB)),
  jacarta(Color(0xff3A3A55)),


  cultured(Color(0xffF6F6F6)),


  blueMediumSlate(Color(0xff8077E4)),
  mediumPurple(Color(0xff8C84E2)),
  darkBlueGray(Color(0xff6C689F)),
  blueGray(Color(0xff678BD2)),
  greenSheen(Color(0xff71A59F)),

  violetAfrican(Color(0xffC384C8)),
  pinkBakerMiller(Color(0xffFF90AF)),
  pinkCandy(Color(0xffE27777)),
  goldCrayola(Color(0xffF1B488)),
  whiteLilac(Color(0xffF8F7FC)),

  // Match result page colors
  gold(Color(0xFFFFD700)),
  skillsMatchGreen(Color(0xFF4ECCA3)),
  visionAlignBlue(Color(0xFF5DADE2)),
  experiencePurple(Color(0xFFBB86FC)),
  startChatOrange(Color(0xFFF27361)),
  heartRed(Color(0xFFE53935)),
  statusGreen(Color(0xFF43A047)),
  statusBlue(Color(0xFF1E88E5)),
  greyLight(Color(0xFFBDBDBD)),
  platinum(Color(0xffE5E7EB)),
  white(Color(0xFFFFFFFF));

  final Color value;
  const AppColors(this.value);
}