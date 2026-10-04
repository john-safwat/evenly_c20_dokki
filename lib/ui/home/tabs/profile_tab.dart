import 'package:evently_c20_dokki/core/config/app_config.dart';
import 'package:evently_c20_dokki/core/utils/context_extention.dart';
import 'package:evently_c20_dokki/core/utils/icons_extension.dart';
import 'package:evently_c20_dokki/core/utils/widget_extension.dart';
import 'package:evently_c20_dokki/ui/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.onError,
                shape: BoxShape.circle,
              ),
              height: MediaQuery.sizeOf(context).width * .3,
              width: MediaQuery.sizeOf(context).width * .3,
              child: Image.asset(
                "assets/images/app_logo_${provider.themeMode == ThemeMode.light ? "light" : "dark"}.png",
              ),
            ),
            Text(user?.displayName??"Unknown"),
            Text(user?.email??"Unknown"),
            Container(
              decoration: BoxDecoration(
                color: context.colors.onError,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: Text("Dark Mode")),
                  Switch(
                    value: provider.isDarkMode,
                    onChanged: (value) {
                      provider.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.colors.onError,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: Text("English")),
                  Switch(
                    value: provider.isEn,
                    onChanged: (value) {
                      provider.changeLocale(value? "en" : "ar");
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.colors.onError,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: Text("Logout")),
                  IconButton(onPressed: (){
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  }, icon: Icons.logout.toIcon),
                ],
              ),
            )

          ],
        ).allPadding(16),
      ),
    );
  }
}
