import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nature_things/bloc/main/main_page.dart';
import 'package:nature_things/compnents/components/scaffold/tabview/tabview_scaffold.dart';
import 'package:nature_things/generated/i18n.dart';
import 'package:nature_things/res/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/setting/setting_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MainPage(),
      home: TabViewScaffold(
        pages: [Container(color: Colors.blue),Container(color: Colors.red)],
        tabs: [
        TabModel(id: "1", module: "add", name: "s"),
        TabModel(id: "2", module: "list", name: "2"),
      ]
      ),
      title: 'Flutter Demo',
      theme: myTheme,
      // ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      localizationsDelegates: const [
        S.delegate,
        RefreshLocalizations.delegate, //下拉刷新
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

