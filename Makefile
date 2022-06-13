build:
	docker buildx build --platform linux/amd64 -f Dockerfile -t adburpitt/postgres-aws-s3:latest . --push