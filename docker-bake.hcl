variable "TAG_FROM_GIT_SHA" {
  default = "latest"
}
variable "TAG_FROM_GIT_REF_NAME" {
  default = "latest"
}

target "default" {
  output = CAN_PUSH ? ["type=registry"] : ["type=docker"]
}
// only CI should push images and caches
// you *could* push from a local machine in an emergency,
// by setting this to "true" in the `docker buildx bake` command
variable "CAN_PUSH" {
  default = false
}

target "base" {
    inherits = ["default"]
    context = "."
    dockerfile = "base.Dockerfile"
    target = "builder"
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:${TAG_FROM_GIT_REF_NAME}",
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:main"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:${TAG_FROM_GIT_REF_NAME},mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/base:${TAG_FROM_GIT_REF_NAME}",
        "ghcr.io/maxheld83/mc-cache/base:${TAG_FROM_GIT_SHA}",
    ]
}

group "app" {
    targets = [
        "runner",
        "tester"
    ]
}

target "runner" {
    inherits = ["default"]
    dockerfile = "app.Dockerfile"
    target = "runner"
    contexts = {
        base = "target:base"
    }
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/runner/cache:${TAG_FROM_GIT_REF_NAME}",
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/runner/cache:main"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/runner/cache:${TAG_FROM_GIT_REF_NAME},mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/runner:${TAG_FROM_GIT_REF_NAME}",
        "ghcr.io/maxheld83/mc-cache/runner:${TAG_FROM_GIT_SHA}"
    ]
}

target "tester" {
    inherits = ["default"]
    dockerfile = "app.Dockerfile"
    target = "runner"
    contexts = {
        base = "target:base"
    }
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/tester/cache:${TAG_FROM_GIT_REF_NAME}",
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/tester/cache:main"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/tester/cache:${TAG_FROM_GIT_REF_NAME},mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/tester:${TAG_FROM_GIT_REF_NAME}",
        "ghcr.io/maxheld83/mc-cache/tester:${TAG_FROM_GIT_SHA}"
    ]
}
