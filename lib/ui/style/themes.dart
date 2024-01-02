import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  ThemeData get darkTheme => ThemeData(
        fontFamily: 'jannah',
        primarySwatch: Colors.deepOrange,
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xff333739),
        appBarTheme: const AppBarTheme(
          titleSpacing: 20,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff333739),
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Color(0xff333739),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'jannah',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.white,
          elevation: 20,
          selectedItemColor: Colors.deepOrange,
          backgroundColor: Colors.black54,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          titleMedium: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
        ),
      );

  ThemeData get lightTheme => ThemeData(
        fontFamily: 'jannah',
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          titleSpacing: 20,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'jannah',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.white,
          elevation: 20,
          selectedItemColor: Colors.deepOrange,
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          titleMedium: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.3,
          ),
        ),
      );
}
