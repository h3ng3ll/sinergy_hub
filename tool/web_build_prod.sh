
cd ..

cp -r web/flavor/prod/ web

TEMPLATE="web/index.html.template"
OUTPUT="web/index.html"

# Загружаем .env
set -a
source .env
set +a

sed "s|{{GOOGLE_SIGNIN_CLIENT_ID}}|$PROD_SERVER_CLIENT_ID|g" \
    $TEMPLATE > $OUTPUT

flutter run \
-d chrome \
--web-port 5000 \
--web-hostname localhost \
--flavor=prod \
--dart-define=DARTENV=prod \
--dart-define="PROD_SERVER_CLIENT_ID=$PROD_SERVER_CLIENT_ID"
--dart-define="PROD_FIREBASE_WEB_PUSH_CERTIFICATE=$PROD_FIREBASE_WEB_PUSH_CERTIFICATE"