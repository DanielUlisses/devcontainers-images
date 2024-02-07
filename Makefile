build-ubuntu-base:
	@echo "build ubuntu base image"
	@cd ubuntu-base && chmod +x ./build.sh && ./build.sh

build-terraform-image:
	@echo "build terraform image"
	@cd terraform-terratest && chmod +x ./build.sh && ./build.sh

build-azure-terraform:
	@echo "build azure image"
	@cd azure-terraform && chmod +x ./build.sh && ./build.sh

build-aws-terraform:
	@echo "build aws image"
	@cd aws-terraform && chmod +x ./build.sh && ./build.sh