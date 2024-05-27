import 'package:flutter/material.dart';
import 'package:hi_riveroid/application.dart';
import 'package:hi_riveroid/utils/state_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: HiRiverpodApplication(),
    )
  );
}