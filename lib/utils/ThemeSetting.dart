/*
 * Copyright 2019 ToolBone. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/enums/ThemeType.dart';

ThemeData buildTheme(ThemeType themeType) {
  final ThemeDataMode _themeDataMode = _generate(themeType);

  final ThemeData _base = ThemeData(
    fontFamily: 'Aller',
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    primaryColor: Colors.lightBlue[800],
    accentColor: Colors.cyan[600],
    backgroundColor: Colors.redAccent,
  );

  return _base.copyWith(
    textTheme: _buildTextTheme(_base.textTheme, _themeDataMode),
    primaryTextTheme: _buildTextTheme(_base.primaryTextTheme, _themeDataMode),
    accentTextTheme: _buildTextTheme(_base.accentTextTheme, _themeDataMode),
  );
}

TextTheme _buildTextTheme(TextTheme base, ThemeDataMode themeDataMode) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: themeDataMode.fontWeightHeadline,
      color: themeDataMode.colorHeadline,
    ),
    title: base.title.copyWith(
      fontWeight: themeDataMode.fontWeightTitle,
      fontSize: themeDataMode.fontSizeTitle,
      color: themeDataMode.colorTitle,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body1: base.body1.copyWith(
      fontWeight: themeDataMode.fontWeight,
      fontSize: themeDataMode.fontSize,
      color: themeDataMode.color,
    ),
    body2: base.body2.copyWith(
      fontWeight: themeDataMode.fontWeight,
      fontSize: themeDataMode.fontSize,
      color: themeDataMode.color,
    ),
  );
}

class ThemeDataMode {
  String fontFamily;
  Brightness brightness;
  Color primarySwatch;
  Color primaryColor;
  Color accentColor;
  Color backgroundColor;

  FontWeight fontWeight;
  double fontSize;
  Color color;

  FontWeight fontWeightTitle;
  double fontSizeTitle;
  Color colorTitle;

  FontWeight fontWeightHeadline;
  double fontSizeHeadline;
  Color colorHeadline;

  FontWeight fontWeightCaption;
  double fontSizeCaption;
  Color colorCaption;

  ThemeDataMode(
    this.fontFamily,
    this.primaryColor,
    this.primarySwatch,
    this.fontWeight,
    this.fontSize,
    this.color,
  );

  ThemeDataMode.init() {
    //default setting will be override one _generate is called
    fontSize = 12.0;
    fontWeight = FontWeight.normal;
    color = Colors.black;

    fontWeightTitle = FontWeight.w700;
    fontSizeTitle = 24.0;
    colorTitle = Colors.black;

    fontWeightHeadline = FontWeight.w500;
    fontSizeHeadline = 24.0;
    colorHeadline = Colors.black;

    fontWeightCaption = FontWeight.normal;
    fontSizeCaption = 24.0;
    colorCaption = Colors.black;
  }
}

ThemeDataMode _generate(ThemeType themeType) {
  ThemeDataMode _themeDataMode = ThemeDataMode.init();

  switch (themeType) {
    case ThemeType.BLUE:
      {
        _themeDataMode = ThemeDataMode("Aller", Colors.lightBlue[800],
            Colors.blue, FontWeight.w700, 16.0, Colors.red);
      }
      break;

    case ThemeType.ALLER:
      {
        _themeDataMode = ThemeDataMode("Aller", Colors.lightBlue[800],
            Colors.blue, FontWeight.w700, 12.0, Colors.black);
      }
      break;

    default:
      {
        _themeDataMode = ThemeDataMode("Aller", Colors.lightBlue[800],
            Colors.blue, FontWeight.w700, 12.0, Colors.black);
      }

      break;
  }

  return _themeDataMode;
}
