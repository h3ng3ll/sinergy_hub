# synergy_hub

A new Flutter project.

## Getting Started

0. generate files
   flutter pub get
   flutter pub run build_runner build -d
1. fill .env file
2. setup firebase
```shell
   dart pub global activate flutterfire_cli
   flutterfire configure --project=synergyhub-a3e1b
```

3. Ensure Firebase has fingerprints for both debug and release modes by
   
```shell
   cd android  && ./gradlew signingReport && cd ..
```

4. Setup cors for firebase web
```shell
    gsutil cors set cors.json   gs://synergyhub-a3e1b.firebasestorage.app
    # Or recommended new  way
    gcloud storage buckets update gs://synergyhub-a3e1b.firebasestorage.app \
  --cors-file=cors.json
```

   

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
