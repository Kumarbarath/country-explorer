import 'package:country_explorer/modules/home/provider/country_list_provider.dart';
import 'package:country_explorer/modules/home/view/country_list.dart';
import 'package:country_explorer/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MaterialApp(
          theme: customTheme,
          debugShowCheckedModeBanner: false, home: CountryExplorer()));
}
