import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as developer;

/// Useful to log state change in our application
/// Read the logs and you'll better understand what's going on under the hood
class StateLogger extends ProviderObserver {
  const StateLogger();

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    developer.log('Provider $provider was initialized with $value');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    developer.log('Provider $provider was disposed');
  }

  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    developer.log('''
      {
        provider: ${provider.name ?? provider.runtimeType},
        oldValue: $previousValue,
        newValue: $newValue
      }
    ''');
  }

  @override
  void providerDidFail(
      ProviderBase<Object?> provider,
      Object error,
      StackTrace stackTrace,
      ProviderContainer container) {
    developer.log('Provider $provider threw $error at $stackTrace');
  }
}