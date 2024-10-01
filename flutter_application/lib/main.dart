import 'package:flutter/material.dart';
import 'package:flutter_application/logic/cubits/text_qr_image_cubit.dart';
import 'package:flutter_application/views/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (ctx) => TextQrImageCubit())],
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.blueGrey,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ));
  }
}
