target deps {
  dockerfile = "docker/main/Dockerfile"
  platforms = ["linux/arm64"]
  target = "deps"
}

target rootfs {
  dockerfile = "docker/main/Dockerfile"
  platforms = ["linux/arm64"]
  target = "rootfs"
}

target ax650 {
  dockerfile = "docker/axera/Dockerfile_ax650"
  contexts = {
    deps = "target:deps",
    rootfs = "target:rootfs"
  }
  platforms = ["linux/arm64"]
}
