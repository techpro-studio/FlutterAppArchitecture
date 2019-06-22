#!/bin/bash
rm -rf ./lib/l10n
mkdir ./lib/l10n
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localization.dart
wait
cd ./lib/l10n
cp intl_messages.arb intl_ru.arb
cp intl_messages.arb intl_en.arb
rm intl_messages.arb
cd ..
cd ..

flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \
   --no-use-deferred-loading lib/localization.dart lib/l10n/intl_*.arb