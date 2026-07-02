import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:masrophy_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const MasrophyApp());
}
