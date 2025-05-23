import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/configs/app_configs.dart';
import 'package:midad/core/keys/keys.dart';
import 'package:midad/initialize_app.dart';
import 'package:midad/services/local_storage/storage_service.dart';

final storage = locator<StorageService>();

class LocaleNotifier extends Notifier<Locale> {
  @override
  build() {
    final savedLanguageCode = storage.read(languageCodeKey);
    return Locale(
      savedLanguageCode.isEmpty ? AppConfigs.defaultLocale : savedLanguageCode,
    );
  }

  /// Change the default locale
  Future<void> changeLocale(Locale? value) async {
    if (value != null) {
      state = value;

      await storage.save(languageCodeKey, value.languageCode);
    }
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new);
