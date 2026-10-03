
cd ..

cp -r web/flavor/dev/ web

TEMPLATE="web/index.html.template"
OUTPUT="web/index.html"

# Загружаем .env
set -a
source ../.env
set +a

sed "s|{{GOOGLE_SIGNIN_CLIENT_ID}}|$DEV_SERVER_CLIENT_ID|g" \
    $TEMPLATE > $OUTPUT

flutter run \
-d chrome \
--web-port 5000 \
--web-hostname localhost \
--flavor=development \
--dart-define=DARTENV="development" \
--dart-define="DEV_FIREBASE_WEB_PUSH_CERTIFICATE=$DEV_FIREBASE_WEB_PUSH_CERTIFICATE" \
--dart-define="DEV_SERVER_CLIENT_ID=$DEV_SERVER_CLIENT_ID" \
--dart-define="FIREBASE_PROJECT_WEB_URL=$DEV_SERVER_CLIENT_ID"