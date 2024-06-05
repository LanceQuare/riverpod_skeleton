import 'package:flutter/material.dart';
import 'package:riverpod_skeleton/application.dart';
import 'package:riverpod_skeleton/utils/dio_utils.dart';
import 'package:riverpod_skeleton/utils/isar_utils.dart';
import 'package:riverpod_skeleton/utils/state_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async{
  await init();
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: HiRiverpodApplication(),
    )
  );
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarUtils().init();
  DioUtils().init();
}