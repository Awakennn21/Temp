import 'package:VetLink/features/authorization/presentation/pages/AuthorizationPage.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget
{
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
        body:  AuthorizationPage()
      ); 
  }
}