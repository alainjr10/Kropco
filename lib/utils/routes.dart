import 'package:flutter/cupertino.dart';
import 'package:kropco/views/auth/login.dart';
import 'package:kropco/views/auth/signup.dart';
import 'package:kropco/views/dashboard_screen.dart';
import 'package:kropco/views/disease_detection_screen.dart';
import 'package:kropco/views/forum_screen.dart';
import 'package:kropco/views/home_screen.dart';
import 'package:kropco/views/homepage.dart';
import 'package:kropco/views/no_recognitions.dart';
import 'package:kropco/views/notifications_screen.dart';
import 'package:kropco/views/recently_viewed_screen.dart';
import 'package:kropco/views/settings_screen.dart';
import 'package:kropco/views/storage_centers_screen.dart';
import 'package:kropco/views/suggestions_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => const Home(),
  HomeScreen.homeScreenId: (context) => const HomeScreen(),
  DiseaseDetection.diseaseDetectionScreenId: (context) =>
      const DiseaseDetection(),
  StorageCenters.storageCentersScreenId: (context) => const StorageCenters(),
  Settings.settingsScreenId: (context) => const Settings(),
  Dashboard.dashboardScreenId: (context) => const Dashboard(),
  Forum.forumScreenId: (context) => const Forum(),
  Suggestions.suggestionsScreenId: (context) => const Suggestions(),
  RecentlyViewed.recentlyViewedScreenId: (context) => const RecentlyViewed(),
  NotificationsScreen.notificationsScreenId: (context) =>
      const NotificationsScreen(),
  NoRecognitions.noRecognitionsScreenId: (context) => const NoRecognitions(),
  SignInWithEmail.signInWithEmailScreenID: (context) => const SignInWithEmail(),
  SignUp.signUpScreenId: (context) => const SignUp(),
};
