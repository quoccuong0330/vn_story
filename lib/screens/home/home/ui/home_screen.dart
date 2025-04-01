import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vn_story/blocs/blocs.dart';
import 'package:vn_story/cubits/cubits.dart';
import 'package:vn_story/models/models.dart';
import 'package:vn_story/widgets/buttons/button_primary_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void handleLogin(UserCubit cubit) async {
    await cubit.signOut();
    context.replace("/login");
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final cubit = context.watch<UserCubit>();
    UserEntity? user;
    if (authState.isAuthenticated) {
      user = authState.user;
    }
    return Center(
      child: Column(
        children: [
          Text(user?.email ?? "Co cai nit"),
          ButtonPrimaryCustom(
            isProcessing: false,
            onPressed: () => handleLogin(cubit),
            title: "logout",
          ),
        ],
      ),
    );
  }
}
