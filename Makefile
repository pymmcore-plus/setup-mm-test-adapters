.PHONY: all tag-release

# Default action does nothing to avoid accidental runs
all:
	@echo "No default action"

# Use this to create a release
tag-release:
	@echo "Creating Git tag for release..."
	@read -p "Version number (e.g. v1.0.0): " VERSION; \
	git tag -a $$VERSION -m "Release $$VERSION"; \
	echo "Tag $$VERSION created. Push with: git push origin $$VERSION"
