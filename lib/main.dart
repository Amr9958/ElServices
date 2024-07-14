import 'package:Elservices/core/cash/shared_pref.dart';
import 'package:Elservices/core/darkMode/darkModeCubit.dart';
import 'package:Elservices/core/darkMode/darkModeStates.dart';
import 'package:Elservices/core/helpers/constant.dart';
import 'package:Elservices/core/languages/LanguagesCupit.dart';
import 'package:Elservices/core/languages/LanguagesCupitStates.dart';
import 'package:Elservices/core/localization/generated/l10n.dart';
import 'package:Elservices/core/routing/app_router.dart';
import 'package:Elservices/core/routing/routes.dart';
import 'package:Elservices/core/thems/appThemes.dart';
import 'package:Elservices/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/bloc/blocobserver.dart';
import 'features/home/cubit/chat_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('messagesBox');
  Bloc.observer = MyBlocObserver();

  await CashHelper.init();

  IsOnboardingFinished =
      CashHelper.getBool(key: 'IsOnboardingFinished') ?? false;

  language = CashHelper.getString(key: 'language');

  brightness = CashHelper.getString(key: 'brightness');
  runApp(ChatGPTApp(
    approuter: Approuter(),
  ));
}

class ChatGPTApp extends StatelessWidget {
  final Approuter approuter;

  const ChatGPTApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => Dark_lightModeCubit()..darkAndlightMode('light'),
        ),
        BlocProvider(
          create: (context) => LanguagesCubit()..changeLanguages('ar'),
        ),
      ],
      child: BlocBuilder<LanguagesCubit, LanguagesState>(
        builder: (context, state) {
          if (state is LanguagesSuccessState) {
            return BlocBuilder<Dark_lightModeCubit, Dark_lightModeState>(
              builder: (context, mode) {
                return ScreenUtilInit(
                  designSize: const Size(380, 812), // used for
                  minTextAdapt: true, // used for
                  child: MaterialApp(
                    locale: (language == null)
                        ? Locale(state.language)
                        : Locale(language!),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    title: 'Elservices App',
                    theme: (brightness == null)
                        ? (mode is LightModeState)
                            ? getlightTheme()
                            : getDarkTheme()
                        : (brightness == 'light')
                            ? getlightTheme()
                            : getDarkTheme(),
                    initialRoute: (!IsOnboardingFinished)
                        ? Routes.SelectLanguagePage
                        : Routes.Mainpage,
                    onGenerateRoute: approuter.generateRoute,
                  ),
                );
              },
            );
          } else {
            return const Scaffold(
                body: Center(child: Text('error at language & brightness')));
          }
        },
      ),
    );
  }
}
