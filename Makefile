test:
	ACT=1 act -j test-action

test-debug:
	ACT=1 act -j test-action -v

# Build a Docker image with required tools for testing
build-test-image:
	docker build -t mm-test-adapters-action-test -f Dockerfile .
