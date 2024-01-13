// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class MessagesScreen extends StatefulWidget {
//   final List messages;
//   const MessagesScreen({Key? key,required this.messages}) : super(key: key);
//   @override
//   _MessagesScreenState createState() => _MessagesScreenState();
// }
// class _MessagesScreenState extends State<MessagesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     return ListView.separated(
//         itemBuilder:(context,index){
//           return Container(
//             margin: EdgeInsets.all(10.sp),
//             child: Row(
//               mainAxisAlignment: widget.messages[index]['isUserMessage']?MainAxisAlignment.end:MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                     padding:EdgeInsets.symmetric(vertical: 13.sp, horizontal: 13.sp),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(
//                            20.sp,
//                           ),
//                           topRight: Radius.circular(20.sp),
//                           bottomRight: Radius.circular(
//                               widget.messages[index]['isUserMessage'] ? 0 : 20.sp),
//                           topLeft: Radius.circular(
//                               widget.messages[index]['isUserMessage'] ? 20.sp : 0),
//                         ),
//                         color: widget.messages[index]['isUserMessage']
//                             ? const Color(0xff00A181)
//                             : Theme.of(context).backgroundColor
//                     ),
//                     constraints: BoxConstraints(maxWidth: w * 2 / 3),
//                     child: Text(
//                       widget.messages[index]['message'].text.text[0],
//                       style: TextStyle(
//                           color: Theme.of(context).disabledColor,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500
//                       ),
//                     )
//                 ),
//               ],
//             ),
//           );
//         },
//         separatorBuilder: (_,i)=>Padding(padding:EdgeInsets.only(top: 10.sp) ),
//         itemCount:widget.messages.length
//     );
//   }
// }