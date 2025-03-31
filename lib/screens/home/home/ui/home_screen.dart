import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/blocs/blocs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    log(authState.toString());
    String? accessToken = "";
    if (authState.isAuthenticated) {
      accessToken = authState.token;
    }
    return Center(child: Text(accessToken ?? "Co cai nit"));
  }
}
