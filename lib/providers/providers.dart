import 'package:flutter_base/constants/keys.dart';
import 'package:flutter_base/providers/auth_provider.dart';
import 'package:flutter_base/providers/user_provider.dart';
import 'package:flutter_base/providers/training_provider.dart';
import 'package:flutter_base/providers/info_provider.dart';
import 'package:flutter_base/providers/resource_provider.dart';
import 'package:flutter_base/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Declaration for all providers
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager()),
  ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
  ChangeNotifierProvider<InfoProvider>(create: (context) => InfoProvider()),
  ChangeNotifierProvider<TrainingProvider>(
      create: (context) => TrainingProvider()),
  ChangeNotifierProvider<ResourceProvider>(
      create: (context) => ResourceProvider()),
  ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
];

var themeManager =
    Provider.of<ThemeManager>(mainKey.currentContext!, listen: false);
var authProvider =
    Provider.of<AuthProvider>(mainKey.currentContext!, listen: false);
var infoProvider =
    Provider.of<InfoProvider>(mainKey.currentContext!, listen: false);
var trainingsProvider =
    Provider.of<TrainingProvider>(mainKey.currentContext!, listen: false);
var resourceProvider =
    Provider.of<ResourceProvider>(mainKey.currentContext!, listen: false);
var userProvider =
    Provider.of<UserProvider>(mainKey.currentContext!, listen: false);
