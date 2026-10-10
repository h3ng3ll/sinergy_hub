flutter build appbundle --release --flavor prod &&
export GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS="$(cat ~/Secrets/google-play-service-account.json)" &&
google-play bundles publish \
--credentials "$GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS" \
--bundle build/app/outputs/bundle/prodRelease/app-prod-release.aab \
--track internal \
--release-name "Test AAB"