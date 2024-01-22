exec_package = main.go
build_flags = -ldflags "-w -s"
exec_file = hellworld

linux_amd64_dist = dist/hellworld-linux-amd64
linux_386_dist = dist/hellworld-linux-386
linux_arm_dist = dist/hellworld-linux-arm
linux_arm64_dist = dist/hellworld-linux-arm64
macos_amd64_dist = dist/hellworld-macos-amd64
macos_arm64_dist = dist/hellworld-macos-arm64
windows_amd64_dist = dist/hellworld-windows-amd64
windows_386_dist = dist/hellworld-windows-386


.PHONY: release linux-amd64 linux-386 linux-arm linux-arm64 macos-amd64 macos-arm64 windows-amd64 windows-386
.DEFAULT_GOAL := release

release: linux-amd64 linux-386 linux-arm linux-arm64 macos-amd64 macos-arm64 windows-amd64 windows-386

linux-amd64:
	mkdir -p $(linux_amd64_dist)
	GOOS=linux GOARCH=amd64 go build $(build_flags) -o $(linux_amd64_dist)/$(exec_file) $(exec_package)
linux-386:
	mkdir -p $(linux_386_dist)
	GOOS=linux GOARCH=386 go build  $(build_flags) -o $(linux_386_dist)/$(exec_file) $(exec_package)
linux-arm:
	mkdir -p $(linux_arm_dist)
	GOOS=linux GOARCH=arm go build  $(build_flags) -o $(linux_arm_dist)/$(exec_file) $(exec_package)
linux-arm64:
	mkdir -p $(linux_arm64_dist)
	GOOS=linux GOARCH=arm64 go build  $(build_flags) -o $(linux_arm64_dist)/$(exec_file) $(exec_package)
macos-amd64:
	mkdir -p $(macos_amd64_dist)
	GOOS=darwin GOARCH=amd64 go build $(build_flags) -o $(macos_amd64_dist)/$(exec_file) $(exec_package)
macos-arm64:
	mkdir -p $(macos_arm64_dist)
	GOOS=darwin GOARCH=arm64 go build $(build_flags) -o $(macos_arm64_dist)/$(exec_file) $(exec_package)
windows-amd64:
	mkdir -p $(windows_amd64_dist)
	GOOS=windows GOARCH=amd64 go build $(build_flags) -o $(windows_amd64_dist)/$(exec_file).exe $(exec_package)
windows-386:
	mkdir -p $(windows_386_dist)
	GOOS=windows GOARCH=386 go build $(build_flags) -o $(windows_386_dist)/$(exec_file).exe $(exec_package)