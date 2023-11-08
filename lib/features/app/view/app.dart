import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spiks_test/core/bloc_core/ui_status.dart';
import 'package:flutter_spiks_test/core/themes/app_themes.dart';
import 'package:flutter_spiks_test/features/app/bloc/app_bloc.dart';
import 'package:flutter_spiks_test/features/therapists/domain/bloc/therapists_list_bloc.dart';
import 'package:flutter_spiks_test/generated/l10n.dart';
import 'package:flutter_spiks_test/injector/injector.dart';
import 'package:flutter_spiks_test/router/app_router.dart';
import 'package:flutter_spiks_test/widgets/splash_page.dart';
import 'package:provider/provider.dart';

import '../../therapist_filters/view_model/filters_view_model.dart';
import '../../therapists/data/repository/therapist_mock_list_repository.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppBloc _appBloc;
  late final TherapistsListBloc _therapistsListBloc;

  @override
  void initState() {
    _appBloc = Injector.instance<AppBloc>()
      ..add(
        const AppEvent.loaded(),
      );
    _therapistsListBloc = TherapistsListBloc(TherapistMockListRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>.value(
          value: _appBloc,
        ),
        BlocProvider<TherapistsListBloc>.value(
          value: _therapistsListBloc,
        ),
      ],
      child: ChangeNotifierProvider<FiltersViewModel>.value(
        value: FiltersViewModel(),
        child: BlocSelector<AppBloc, AppState, UIStatus>(
          bloc: _appBloc,
          selector: (state) => state.status,
          builder: (context, appStatus) {
            return appStatus.when(
              initial: () => const SplashPage(),
              loading: () => const SplashPage(),
              loadFailed: (_) => const SizedBox(),
              loadSuccess: (_) => const _App(),
            );
          },
        ),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final String locale = context.select(
      (AppBloc value) => value.state.locale,
    );

    final bool isDarkMode = context.select(
      (AppBloc value) => value.state.isDarkMode,
    );

    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const AppLocalizationDelegate().supportedLocales,
      locale: Locale(locale),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routerConfig: AppRouter.router,
      title: 'BoilerPlate',
    );
  }
}
