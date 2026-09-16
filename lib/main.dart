import 'package:evently_c20_dokki/core/config/app_config.dart';
import 'package:evently_c20_dokki/core/l10n/app_localizations.dart';
import 'package:evently_c20_dokki/ui/setup/setup_screen.dart';
import 'package:evently_c20_dokki/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var theme = sharedPreferences.getBool("theme") ?? true
      ? ThemeMode.light
      : ThemeMode.dark;
  var locale = sharedPreferences.getString("locale")??"en";
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfig(locale , theme),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfig>(
      builder: (context, provider, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: provider.lightAppTheme,
        darkTheme: provider.darkAppTheme,
        themeMode: provider.themeMode,
        localizationsDelegates: [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.locale),
        routes: {
          SplashScreen.routeName: (_) => SplashScreen(),
          SetupScreen.routeName: (_) => SetupScreen(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
