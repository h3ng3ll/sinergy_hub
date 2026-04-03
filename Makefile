CUSTOM_SW=web/scripts/flutter_service_worker.js

# Main release build target
ReleaseBuild: BumpVersion
	flutter build web --release
	cp $(CUSTOM_SW) build/web/flutter_service_worker.js
	@echo "✅ Build complete and service worker replaced."

# Increments build number (e.g. 1.0.3+4 → 1.0.3+5)
BumpVersion:
	@echo "🔢 Bumping version..."
	@perl -i -pe 's/(version:\s*\d+\.\d+\.\d+\+)(\d+)/sprintf("%s%d", $$1, $$2 + 1)/e' pubspec.yaml
	@grep version pubspec.yaml