import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double defaultScreenWidth = 400.0;
double defaultScreenHeight = 810.0;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;

class AppSizes {
  static double s0 = 0.0;
  static double s1 = 1.0;
  static double s2 = 2.0;
  static double s3 = 3.0;
  static double s4 = 4.0;
  static double s5 = 5.0;
  static double s6 = 6.0;
  static double s7 = 7.0;
  static double s8 = 8.0;
  static double s9 = 9.0;
  static double s10 = 10.0;
  static double s11 = 11.0;
  static double s12 = 12.0;
  static double s13 = 13.0;
  static double s14 = 14.0;
  static double s15 = 15.0;
  static double s16 = 16.0;
  static double s17 = 17.0;
  static double s18 = 18.0;
  static double s19 = 19.0;
  static double s20 = 20.0;
  static double s22 = 22.0;
  static double s24 = 24.0;
  static double s25 = 25.0;
  static double s26 = 26.0;
  static double s28 = 28.0;
  static double s30 = 30.0;
  static double s32 = 32.0;
  static double s35 = 35.0;
  static double s38 = 38.0;
  static double s40 = 40.0;
  static double s45 = 45.0;
  static double s50 = 50.0;
  static double s52 = 52.0;
  static double s55 = 55.0;
  static double s56 = 56.0;
  static double s60 = 60.0;
  static double s65 = 65.0;
  static double s70 = 70.0;
  static double s75 = 75.0;
  static double s76 = 76.0;
  static double s80 = 80.0;
  static double s85 = 85.0;
  static double s90 = 90.0;
  static double s100 = 100.0;
  static double s105 = 105.0;
  static double s110 = 110.0;
  static double s113 = 113.0;
  static double s114 = 114.0;
  static double s120 = 120.0;
  static double s130 = 130.0;
  static double s140 = 140.0;
  static double s150 = 150.0;
  static double s160 = 160.0;
  static double s165 = 165.0;
  static double s170 = 170.0;
  static double s174 = 174.0;
  static double s180 = 180.0;
  static double s200 = 200.0;
  static double s210 = 210.0;
  static double s220 = 220.0;
  static double s230 = 230.0;
  static double s240 = 240.0;
  static double s250 = 250.0;
  static double s260 = 260.0;
  static double s265 = 265.0;
  static double s277 = 277.0;
  static double s280 = 280.0;
  static double s285 = 285.0;
  static double s300 = 300.0;
  static double s320 = 320.0;
  static double s350 = 350.0;
  static double s360 = 360.0;
  static double s370 = 370.0;
  static double s400 = 400.0;
  static double s435 = 435.0;
  static double s450 = 450.0;
  static double s465 = 465.0;
  static double s500 = 500.0;

  /*padding */
  static double paddingHorizontalPage = s20;
  static EdgeInsets generalPadding =
      EdgeInsets.symmetric(horizontal: AppSizes.s16, vertical: AppSizes.s16);

  static double roundedCard = s5;

  /* screen */
  static double widthScreen = double.infinity;

  static Future setScreenAwareConstant(context) async {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    getSize() async {
      if (screenWidth == 0 || screenHeight == 0) {
        screenWidth = MediaQuery.of(context).size.width;
        screenHeight = MediaQuery.of(context).size.height;
        await Future.delayed(const Duration(milliseconds: 300));
        await getSize();
      }
    }

    await getSize();

    if (screenWidth > 300 && screenWidth < 500) {
      defaultScreenWidth = 450.0;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 500 && screenWidth < 600) {
      defaultScreenWidth = 500.0;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 600 && screenWidth < 700) {
      defaultScreenWidth = 550.0;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else if (screenWidth > 700 && screenWidth < 1050) {
      defaultScreenWidth = 800.0;
      defaultScreenHeight = defaultScreenWidth * screenHeight / screenWidth;
    } else {
      defaultScreenWidth = screenWidth;
      defaultScreenHeight = screenHeight;
    }

    if (kDebugMode) {
      print('''
    ========Device Screen Details===============
    screenWidth: $screenWidth
    screenHeight: $screenHeight
    
    defaultScreenWidth: $defaultScreenWidth
    defaultScreenHeight: $defaultScreenHeight
    ''');
    }

    ScreenUtil.init(
      context,
      designSize: Size(
        defaultScreenWidth,
        defaultScreenHeight,
      ),
      //allowFontScaling: true,
    );

    FontSize.setScreenAwareFontSize();

    /*Padding & Margin Constants*/

    s1 = ScreenUtil().setWidth(1.0);
    s2 = ScreenUtil().setWidth(2.0);
    s3 = ScreenUtil().setWidth(3.0);
    s4 = ScreenUtil().setWidth(4.0);
    s5 = ScreenUtil().setWidth(5.0);
    s6 = ScreenUtil().setWidth(6.0);
    s7 = ScreenUtil().setWidth(7.0);
    s8 = ScreenUtil().setWidth(8.0);
    s9 = ScreenUtil().setWidth(9.0);
    s10 = ScreenUtil().setWidth(10.0);
    s11 = ScreenUtil().setWidth(11.0);
    s12 = ScreenUtil().setWidth(12.0);
    s13 = ScreenUtil().setWidth(13.0);
    s14 = ScreenUtil().setWidth(14.0);
    s15 = ScreenUtil().setWidth(15.0);
    s16 = ScreenUtil().setWidth(16.0);
    s17 = ScreenUtil().setWidth(17.0);
    s18 = ScreenUtil().setWidth(18.0);
    s19 = ScreenUtil().setWidth(19.0);
    s20 = ScreenUtil().setWidth(20.0);
    s22 = ScreenUtil().setWidth(22.0);
    s24 = ScreenUtil().setWidth(24.0);
    s25 = ScreenUtil().setWidth(25.0);
    s28 = ScreenUtil().setWidth(28.0);
    s30 = ScreenUtil().setWidth(30.0);
    s35 = ScreenUtil().setWidth(35.0);
    s40 = ScreenUtil().setWidth(40.0);
    s45 = ScreenUtil().setWidth(45.0);
    s50 = ScreenUtil().setWidth(50.0);
    s52 = ScreenUtil().setWidth(52.0);
    s55 = ScreenUtil().setWidth(55.0);
    s56 = ScreenUtil().setWidth(56.0);
    s60 = ScreenUtil().setWidth(60.0);
    s70 = ScreenUtil().setWidth(70.0);
    s75 = ScreenUtil().setWidth(75.0);
    s76 = ScreenUtil().setWidth(76.0);
    s80 = ScreenUtil().setWidth(80.0);
    s85 = ScreenUtil().setWidth(85.0);
    s90 = ScreenUtil().setWidth(90.0);
    s100 = ScreenUtil().setWidth(100.0);
    s110 = ScreenUtil().setWidth(110.0);
    s113 = ScreenUtil().setWidth(113.0);
    s120 = ScreenUtil().setWidth(120.0);
    s130 = ScreenUtil().setWidth(130.0);
    s140 = ScreenUtil().setWidth(140.0);
    s150 = ScreenUtil().setWidth(150.0);
    s160 = ScreenUtil().setWidth(160.0);
    s165 = ScreenUtil().setWidth(165.0);
    s170 = ScreenUtil().setWidth(170.0);
    s180 = ScreenUtil().setWidth(180.0);
    s200 = ScreenUtil().setWidth(200.0);
    s210 = ScreenUtil().setWidth(210.0);
    s220 = ScreenUtil().setWidth(220.0);
    s230 = ScreenUtil().setWidth(230.0);
    s250 = ScreenUtil().setWidth(250.0);
    s260 = ScreenUtil().setWidth(260.0);
    s265 = ScreenUtil().setWidth(265.0);
    s240 = ScreenUtil().setWidth(240.0);
    s280 = ScreenUtil().setWidth(280.0);
    s300 = ScreenUtil().setWidth(300.0);
    s320 = ScreenUtil().setWidth(320.0);
    s350 = ScreenUtil().setWidth(350.0);
    s370 = ScreenUtil().setWidth(370.0);
    s400 = ScreenUtil().setWidth(400.0);
    s435 = ScreenUtil().setWidth(435.0);
    s450 = ScreenUtil().setWidth(450.0);
    s465 = ScreenUtil().setWidth(465.0);
    s500 = ScreenUtil().setWidth(500.0);

    /*EdgeInsets*/

    paddingHorizontalPage = s20;

    roundedCard = s5;

    /* sizes Screen  */
    widthScreen = screenWidth;
  }
}

class FontSize {
  static double smaller = 8.0;
  static double small = 10.0;
  static double medium = 12.0;
  static double defaultSize = 14.0;
  static double large = 16.0;
  static double larger = 18.0;

  static double s0 = 0.0;
  static double s1 = 1.0;
  static double s2 = 2.0;
  static double s3 = 3.0;
  static double s4 = 4.0;
  static double s5 = 5.0;
  static double s6 = 6.0;
  static double s7 = 7.0;
  static double s8 = 8.0;
  static double s9 = 9.0;
  static double s10 = 10.0;
  static double s11 = 11.0;
  static double s12 = 12.0;
  static double s13 = 13.0;
  static double s14 = 14.0;
  static double s15 = 15.0;
  static double s16 = 16.0;
  static double s17 = 17.0;
  static double s18 = 18.0;
  static double s19 = 19.0;
  static double s20 = 20.0;
  static double s21 = 21.0;
  static double s22 = 22.0;
  static double s23 = 23.0;
  static double s24 = 24.0;
  static double s25 = 25.0;
  static double s26 = 26.0;
  static double s27 = 27.0;
  static double s28 = 28.0;
  static double s29 = 29.0;
  static double s30 = 30.0;
  static double s35 = 35.0;
  static double s36 = 36.0;
  static double s40 = 40.0;
  static double s48 = 48.0;
  static double s75 = 75.0;

  FontSize(double s14);

  static setScreenAwareFontSize() {
    smaller = ScreenUtil().setSp(8.0);
    small = ScreenUtil().setSp(10.0);
    medium = ScreenUtil().setSp(12.0);
    defaultSize = ScreenUtil().setSp(14.0);
    large = ScreenUtil().setSp(16.0);
    larger = ScreenUtil().setSp(18.0);

    s1 = ScreenUtil().setSp(1.0);
    s2 = ScreenUtil().setSp(2.0);
    s3 = ScreenUtil().setSp(3.0);
    s4 = ScreenUtil().setSp(4.0);
    s5 = ScreenUtil().setSp(5.0);
    s6 = ScreenUtil().setSp(6.0);
    s7 = ScreenUtil().setSp(7.0);
    s8 = ScreenUtil().setSp(8.0);
    s9 = ScreenUtil().setSp(9.0);
    s10 = ScreenUtil().setSp(10.0);
    s11 = ScreenUtil().setSp(11.0);
    s12 = ScreenUtil().setSp(12.0);
    s13 = ScreenUtil().setSp(13.0);
    s14 = ScreenUtil().setSp(14.0);
    s15 = ScreenUtil().setSp(15.0);
    s16 = ScreenUtil().setSp(16.0);
    s17 = ScreenUtil().setSp(17.0);
    s18 = ScreenUtil().setSp(18.0);
    s19 = ScreenUtil().setSp(19.0);
    s20 = ScreenUtil().setSp(20.0);
    s21 = ScreenUtil().setSp(21.0);
    s22 = ScreenUtil().setSp(22.0);
    s23 = ScreenUtil().setSp(23.0);
    s24 = ScreenUtil().setSp(24.0);
    s25 = ScreenUtil().setSp(25.0);
    s26 = ScreenUtil().setSp(26.0);
    s27 = ScreenUtil().setSp(27.0);
    s28 = ScreenUtil().setSp(28.0);
    s29 = ScreenUtil().setSp(29.0);
    s30 = ScreenUtil().setSp(30.0);
    s36 = ScreenUtil().setSp(36.0);
    s40 = ScreenUtil().setSp(40.0);
    s48 = ScreenUtil().setSp(48.0);
  }
}
