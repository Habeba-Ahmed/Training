import 'package:e_commerci/core/cache/chachehelper.dart';
import 'package:e_commerci/core/shared/constant.dart';
import 'package:e_commerci/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Chachehelper.cacheInitialization();

  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  }

  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}