import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/count_provider.dart';
import 'package:provider_learning/provider/example_one_provider.dart';
import 'package:provider_learning/provider/favourite_provider.dart';
import 'package:provider_learning/provider/theme_changer_provider.dart';
import 'package:provider_learning/screens/Example_One.dart';
import 'package:provider_learning/screens/count_screen.dart';
import 'package:provider_learning/screens/dark_theme.dart';
import 'package:provider_learning/screens/favourite/favourite_screen.dart';
import 'package:provider_learning/screens/stateless_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (_)=>CountProvider()),
       ChangeNotifierProvider(create: (_)=>ExampleOneProvider()),
       ChangeNotifierProvider(create: (_)=>FavouriteItemProvider()),
       ChangeNotifierProvider(create: (_)=>ThemeChangerProvider()),
     ],
      child: Builder(builder: (BuildContext context){
        final themeProvider=Provider.of<ThemeChangerProvider>(context);
        return  MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red, // Set primary swatch to red
            primaryColor: Colors.red,  // Set primary color to red
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.red, // Set AppBar color to red
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 26
              )
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.red, // Set default button color to red
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set elevated button color to red
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.red, // Set icon color to red
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red, // Set floating action button color to red
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.red, // Set dark theme's primary color to red
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.red, // Set AppBar color for dark theme to red
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.red, // Set default button color to red
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set elevated button color to red
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.red, // Set icon color to red
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red, // Set floating action button color to red
            ),
          ),
          home: StatelessScreen(),
        );

      }),
    );

  }
}
