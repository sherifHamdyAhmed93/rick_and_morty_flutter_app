import 'package:flutter/material.dart';
import 'package:fluttter_rick_and_morty/app_router.dart';

void main() {
  runApp(RickAndMortyApp(appRouter: AppRouter(),));
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateAppRoute ,
    );
  }
}

