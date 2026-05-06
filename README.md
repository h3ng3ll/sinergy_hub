# synergy_hub

A new Flutter project.

## Getting Started

0. generate files
   flutter pub get
   flutter pub run build_runner build -d
1. fill .env file

WEB_PUSH_CERTIFICATE - can be found at ProjectSettings -> Cloud Messaging -> Scroll to bottom
CLIENT_ID  - can be extracted from firebase.json

```.dotenv
DEV_SERVER_CLIENT_ID=752*****645-7bc646mg*************.apps.googleusercontent.com
PROD_SERVER_CLIENT_ID=75*****244-931inn0kjb*************.apps.googleusercontent.com
DEV_FIREBASE_WEB_PUSH_CERTIFICATE=BCKEAwpmH6SLxg7xEc
PROD_FIREBASE_WEB_PUSH_CERTIFICATE=BKk1AF0K_36wf
FIREBASE_PROJECT_WEB_URL=synergyh
```

3. setup firebase
```shell
   bash configure.sh
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

# Run build depend on flavor : dev or prod
## Make sure this folders exists and google-services.json are exists both Prod and Dev
### IOS
```
ios/Runner/Firebase/production|development/
```
### Android
```
android/app/src/production|development/
```
flutter run --flavor=development --dart -define=DARTENV=development
flutter run --flavor=prod --dart-define=DARTENV=prod

