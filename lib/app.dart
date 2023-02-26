import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm_ui_test/modules/common/components/keyboard_dismiss/keyboard_dismiss.dart';

import 'modules/common/l10n/generated/l10n.dart';
import 'modules/common/localization/localization_cubit.dart';
import 'modules/onboarding/l10n/generated/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: Modular.get<LocalizationCubit>()),
        // BlocProvider.value(value: Modular.get<HomeBloc>()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
      child: Builder(
        builder: (context) {
          final localizationCubit = context.read<LocalizationCubit>();

          final locale = context.select(
            (LocalizationCubit cubit) => cubit.state.locale,
          );
          // final themeData = context.select(
          //   (ThemeCubit cubit) => cubit.state.themeData,
          // );

          ThemeData themeDataOverride = ThemeData.dark();
          themeDataOverride = themeDataOverride.copyWith(
            // scaffoldBackgroundColor: themeData.color.globalGrayGray100,
            textTheme: themeDataOverride.textTheme.apply(
              bodyColor: const Color(0xffffffff),
            ),
            // iconTheme: themeDataOverride.iconTheme.copyWith(
            //   color: themeData.color.iconNeutralMain,
            // ),
            // snackBarTheme: themeDataOverride.snackBarTheme.copyWith(
            //   backgroundColor: themeData.color.globalBasePrimary,
            //   behavior: SnackBarBehavior.floating,
            // ),
            appBarTheme: themeDataOverride.appBarTheme.copyWith(
              color: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          );

          return MaterialApp.router(
            theme: themeDataOverride,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              OnboardingLocalizations.delegate,
              CommonLocalizations.delegate,
            ],
            supportedLocales: localizationCubit.supportedLocales,
            locale: locale,
            localeResolutionCallback: (_, __) {
              localizationCubit.notifyUpdatedLocale();

              return _;
            },
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1,
              ),
              child: child!,
            ),
          );
        },
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeScreen(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

