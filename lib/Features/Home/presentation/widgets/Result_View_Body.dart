import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:plant_snap/Core/Resources/app_assets.dart';
import 'package:plant_snap/Core/Resources/app_colors.dart';
import 'package:plant_snap/Core/Resources/app_string.dart';
import 'package:plant_snap/Core/Resources/fontWeightText.dart';
import 'package:plant_snap/Core/Widgets/custom_text_button.dart';
import 'package:plant_snap/Core/Widgets/custom_text_widget.dart';
import 'package:plant_snap/Core/helpers/spacingApp.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody(
      {super.key,
      required this.imagePath,
      required this.prediction,
      required this.confidence});
  final File imagePath;
  final String prediction;

  final double confidence;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
                stretch: true,
                pinned: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.scaffoldColor,
                    size: 22.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                expandedHeight: 300.h,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.file(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30.h),
                  child: Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.scaffoldColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        )),
                  ),
                )),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextTitle(
                          //انا عملت كده علشان اغير شكل الكلام اللي جاي من api
                          text: prediction == 'Potato__Early_blight'
                              ? 'Potato Early Blight'
                              : 'Potato Late Blight',
                          fontWeight: FontWeightAppText.bold,
                          size: 28.sp,
                          color: AppColors.buttonIconsColor,
                        ),
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1.4.w,
                                  color: AppColors.buttonIconsColor)),
                          child: Center(
                            child: TextTitle(
                              text: '$confidence%',
                              fontWeight: FontWeightAppText.bold,
                              size: 20.sp,
                              color: AppColors.blueLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(15),
                    TextTitle(
                      text: "Description",
                      fontWeight: FontWeightAppText.medium,
                      size: 22.sp,
                      color: AppColors.black,
                    ),
                    verticalSpacing(10),
                    TextTitle(
                      text: prediction == 'Potato__Early_blight'
                          ? AppString.descriptionEarly
                          : AppString.descriptionLate,
                      fontWeight: FontWeightAppText.regular,
                      size: 18.sp,
                      color: AppColors.textGrey,
                    ),
                    //button
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.all(20.sp),
            child: CustomTextButton(
                function: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 40.sp,
                                  color: AppColors.buttonIconsColor,
                                ),
                              ),
                              ConditionalBuilder(
                                condition:
                                prediction == 'Potato__Early_blight',
                                builder: (context) => SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Pesticide',
                                              style: GoogleFonts.aBeeZee(
                                                  color: AppColors.buttonIconsColor,
                                                  fontSize:30.sp)),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amistar Top pesticide:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                ' at a rate of 50 cm3 / 100 liters of water.',
                                                style: TextStyle(
                                                    fontSize:18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:4.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Pellez pesticide:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize:20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '  at a rate of 50 g / 100 liters of water .',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Score pesticide:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                ' at a rate of 50 g / 100 liters of water .',
                                                style: TextStyle(
                                                    fontSize:18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  openLink(
                                                      'https://www.youtube.com/watch?v=UM7mOoJRci4');
                                                },
                                                child: SizedBox(
                                                  height: 50.h,
                                                  width: 50.w,
                                                  child:const Icon(Bootstrap.youtube),),
                                              ),
                                              SizedBox(
                                                width: 10.sp,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  openLink(
                                                      'https://alfallahalyoum.news/%D9%83%D9%8A%D9%81-%D8%AA%D9%83%D8%A7%D9%81%D8%AD-%D9%85%D8%B1%D8%B6-%D8%A7%D9%84%D9%86%D8%AF%D9%88%D8%A9-%D8%A7%D9%84%D9%85%D8%AA%D8%A3%D8%AE%D8%B1%D8%A9-%D9%81%D9%8A-%D8%A7%D9%84%D8%A8%D8%B7%D8%A7.html');
                                                },
                                                child: SizedBox(
                                                  height: 50.h,
                                                  width: 50.w,
                                                  child:  const Icon(Bootstrap.google),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Divider(
                                            color: Theme.of(context)
                                                .disabledColor,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'feedback',
                                                style: GoogleFonts.acme(
                                                    fontSize: 22.sp,
                                                    color: Theme.of(context)
                                                        .disabledColor),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        openLink(
                                                            'https://wa.me/+2001113312766');
                                                      },
                                                      icon: Icon(
                                                        Icons.chat,
                                                        color: Theme.of(
                                                            context)
                                                            .disabledColor,
                                                        size:30.sp,
                                                      )),
                                                  Text(
                                                    ' Technical support',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize:
                                                        18.sp),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                fallback: (context) => SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text('Pesticide',
                                              style: GoogleFonts.aBeeZee(
                                                  color: AppColors.buttonIconsColor,
                                                  fontSize: 30.sp)),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Copper aerobatics:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                ' 46% at a rate of 250 gm/100 liters of water.',
                                                style: TextStyle(
                                                    fontSize:18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amistar:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize:20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '  25% at a rate of 50 cm/100 liters of water.',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Rivas:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '  25% at a rate of 50 cm/100 liters of water.',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Belize:-',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                ' 75gm/100 liters of water.',
                                                style: TextStyle(
                                                    fontSize:18.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  openLink(
                                                      'https://www.youtube.com/watch?v=UM7mOoJRci4');
                                                },
                                                child: SizedBox(
                                                  height: 50.h,
                                                  width: 50.w,
                                                  child: const Icon(Bootstrap.youtube),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.sp,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  openLink(
                                                      'https://alfallahalyoum.news/%D9%83%D9%8A%D9%81-%D8%AA%D9%83%D8%A7%D9%81%D8%AD-%D9%85%D8%B1%D8%B6-%D8%A7%D9%84%D9%86%D8%AF%D9%88%D8%A9-%D8%A7%D9%84%D9%85%D8%AA%D8%A3%D8%AE%D8%B1%D8%A9-%D9%81%D9%8A-%D8%A7%D9%84%D8%A8%D8%B7%D8%A7.html');
                                                },
                                                child: SizedBox(
                                                  height: 50.h,
                                                  width: 50.w,
                                                  child: const Icon(Bootstrap.google),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Divider(
                                            color: Theme.of(context)
                                                .disabledColor,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'feedback',
                                                style: GoogleFonts.acme(
                                                    fontSize:22.sp,
                                                    color: Theme.of(context)
                                                        .disabledColor
                                                ),
                                              ),
                                              verticalSpacing(10),
                                              InkWell(
                                                onTap: (){
                                                  openLink(
                                                      'https://wa.me/+2001113312766'
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.chat,
                                                      color: Theme.of(
                                                          context)
                                                          .disabledColor,
                                                      size: 25.sp,
                                                    ),
                                                    Text(
                                                      ' Technical support',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                          15.sp
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                  );
                },
                size: 20.sp,
                widget: TextTitle(
                  size: 18.sp,
                  fontWeight: FontWeightAppText.bold,
                  text: 'Click to know the treatment',
                  color: AppColors.scaffoldColor,
                )),
          ),
        )
      ],
    );
  }
  Future<void>openLink(String link)async{
    var urlink=link;
    if(await canLaunch((urlink))){
      await launch (urlink);
    }
    else{
      await launch (urlink);
    }
  }
}
