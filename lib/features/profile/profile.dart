import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Profile", style: TextStyles.font34myBlack700W),
            verticalSpacing(10),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              title: Text("Amr Hussein", style: TextStyles.font14Black500W),
              subtitle: Text(
                "matildabrown@mail.com",
                style: TextStyles.font14gray500W,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listTileData[index].title , style: TextStyles.font14Black500W,),
                  subtitle: Text(listTileData[index].subTitle , style: TextStyles.font11Graye600W),
                  trailing: listTileData[index].trailing,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.6,
                );
              },
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}

List<ListTileModel> listTileData = [
  ListTileModel(title: "My orders", subTitle: 'Already have 12 orders'),
  ListTileModel(title: "Shipping addresses", subTitle: '3 ddresses'),
  ListTileModel(title: 'Payment methods', subTitle: 'Visa  **34'),
  ListTileModel(title: 'Promocodes', subTitle: 'You have special promocodes'),
  ListTileModel(title: 'My reviews', subTitle: 'Reviews for 4 items'),
  ListTileModel(title: 'Settings', subTitle: 'Notifications, password'),
];

class ListTileModel {
  final String title;
  final String subTitle;
  final Widget trailing = Icon(Icons.keyboard_arrow_right);

  ListTileModel({required this.title, required this.subTitle});
}
