



dart pub global activate flutterfire_cli

# Prod
cd ..
flutterfire config \
  --project=sinergyhub-prod \
  --out=lib/firebase/firebase_options_prod.dart \
  --ios-bundle-id=com.hengell.synergyhub \
  --ios-out=ios/Runner/Firebase/production/GoogleService-Info.plist \
  --android-package-name=com.hengell.sinergyHub \
  --android-out=android/app/src/prod/google-services.json \
  --yes


# Dev

flutterfire config \
  --project=synergyhub-a3e1b\
  --out=lib/firebase/firebase_options_dev.dart \
  --ios-bundle-id=com.hengell.sinergyhub.dev \
  --ios-out=ios/Runner/Firebase/development/GoogleService-Info.plist \
  --android-package-name=com.hengell.synergyhub.dev \
  --android-out=android/app/src/development/google-services.json \
  --yes