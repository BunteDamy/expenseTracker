import 'package:bloc/bloc.dart';
import 'package:expensetracker/app.dart';
import 'package:expensetracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}