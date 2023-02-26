// ignore_for_file: unnecessary_this, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get He25B => this.copyWith(
        fontSize: 25,
        height: 32 / 25,
        fontWeight: FontWeight.w700,
      );
  TextStyle get He21Sb => this.copyWith(
        fontSize: 21,
        height: 24 / 21,
        fontWeight: FontWeight.w600,
      );
  TextStyle get He21Re => this.copyWith(
        fontSize: 21,
        height: 24 / 21,
        fontWeight: FontWeight.w400,
      );

  TextStyle get Bo17B => this.copyWith(
        fontSize: 17,
        height: 20 / 17,
        fontWeight: FontWeight.w500,
      );
  TextStyle get Bo16Me => this.copyWith(
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w500,
      );
  TextStyle get Bo16Re => this.copyWith(
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w400,
      );
  TextStyle get Bo15Se => this.copyWith(
        fontSize: 15,
        height: 18 / 15,
        fontWeight: FontWeight.w600,
      );
  TextStyle get Bo15Re => this.copyWith(
        fontSize: 15,
        height: 18 / 15,
        fontWeight: FontWeight.w400,
      );

  TextStyle get Ca14Re => this.copyWith(
        fontSize: 14,
        height: 18 / 14,
        fontWeight: FontWeight.w400,
      );
  TextStyle get Ca12Re => this.copyWith(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
      );
  TextStyle get Ca11Me => this.copyWith(
        fontSize: 11,
        height: 12 / 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.008,
      );
  TextStyle get Ca10Me => this.copyWith(
        fontSize: 10,
        height: 14 / 10,
        fontWeight: FontWeight.w500,
      );
}
