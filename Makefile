.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: generate
generate:
	./bin/generate_l10n.bash ${MODULE}

.PHONY: build-and-gen
build-and-gen:
	flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && ./bin/generate_l10n.bash ${MODULE}