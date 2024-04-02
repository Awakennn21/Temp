import 'package:VetLink/core/services/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:VetLink/features/skeleton/skeleton.dart';
Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeDependencies();
  
  runApp(const VetLink());
}

class VetLink extends StatelessWidget 
{
  const VetLink({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          home: const HomePage(Title: 'VetLink'),
      ); 
   
  }
}

class HomePage extends StatefulWidget 
{
  const HomePage({super.key, required this.Title});

  final String Title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> 
{
  @override
  Widget build(BuildContext context) 
  {
    return const Skeleton();
  }
}
