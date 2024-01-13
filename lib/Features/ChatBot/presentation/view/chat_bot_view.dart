
// import 'package:dialog_flowtter/dialog_flowtter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:plant_snap/Core/Resources/app_assets.dart';
// import 'package:plant_snap/Core/Resources/app_colors.dart';
// import 'messages.dart';
// import 'package:dialog_flowtter/dialog_flowtter.dart' as df;
// class ChatBoot extends StatefulWidget {
//   @override
//   State<ChatBoot> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<ChatBoot> {
//   late DialogFlowtter dialogflowtter;
//   final TextEditingController _controller=TextEditingController();
//   List<Map<String,dynamic>> messages=[];
//   @override
//   void initState(){
//     super.initState();
//     DialogFlowtter.fromFile().then((instance) =>dialogflowtter=instance);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20.h,
//           ),
//           Padding(
//             padding:  EdgeInsets.all(16.sp),
//             child: Row(
//               children: [
//                 IconButton(onPressed: (){
//                   Navigator.pop(context);
//                 }, icon: Icon(
//                  Icons.arrow_back_ios,
//                   size:30.sp,
//                   color: AppColors.buttonIconsColor,
//                 )),
//                 Text(
//                   'Chat Bot',
//                   style: GoogleFonts.montserrat(
//                       color: Theme.of(context).disabledColor,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 const Spacer(),
//                 Image(
//                   width: 60.w,
//                   height:60.h,
//                   image:const AssetImage(
//                     AppAssets.iconScan
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Divider(
//             color: Colors.grey,
//             height: 1.h,
//             thickness: .5,
//           ),
//           Expanded(child:MessagesScreen(messages:messages)),
//           Padding(
//             padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical:10.sp ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     cursorColor: AppColors.buttonIconsColor,
//                     decoration:  InputDecoration(
//                       hintText: 'Type a message...',
//                       hintStyle: TextStyle(
//                           color:  AppColors.buttonIconsColor,
//                           fontSize: 16.sp
//                       ),
//                       filled: true,
//                       fillColor: Theme.of(context).backgroundColor,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.sp),
//                         borderSide: BorderSide(
//                             color: AppColors.buttonIconsColor
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.sp),
//                         borderSide: BorderSide(
//                             color: AppColors.buttonIconsColor
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.sp),
//                         borderSide: BorderSide(
//                             color: AppColors.buttonIconsColor
//                         ),
//                       ),
//                     ),
//                     controller: _controller,
//                     style:  TextStyle(
//                       color: Theme.of(context).disabledColor,
//                       fontSize:18.sp,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width:6.w,),
//                 Container(
//                   width:53.w,
//                   height: 53.h,
//                   decoration: BoxDecoration(
//                     borderRadius:BorderRadius.circular(20.sp),
//                     color:  AppColors.buttonIconsColor
//                   ),
//                   child: IconButton(onPressed: (){
//                     sendMessages(_controller.text);
//                     _controller.clear();
//                   }, icon:  Icon(
//                    Icons.send,
//                     color:AppColors.scaffoldColor,
//                     size:30.sp,
//                   )),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ) ,
//     );
//   }
//
//   sendMessages(String text)async {
//     if(text.isEmpty){
//       print('****************');
//       print('Message is empty');
//       print('****************');
//     }
//     else{
//       setState(() {
//         addMessage(Message(
//             text: DialogText(text: [text])),true);
//       });
//       DetectIntentResponse response=await dialogflowtter.detectIntent(
//           queryInput: QueryInput(text:df.TextInput(text: text)));
//       if(response.message==null)return;
//       else{
//         setState(() {
//           addMessage(response.message!);
//         });
//       }
//     }
//   }
//   addMessage(Message message, [bool isUserMessage=false]){
//     messages.add({
//       'message':message,
//       'isUserMessage':isUserMessage,
//     });
//   }
// }
