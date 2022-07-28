variable "TAG_FROM_GIT_REF_NAME" {
  default = "latest"
}

target "base" {
    dockerfile = "base.Dockerfile"
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:${TAG_FROM_GIT_REF_NAME}"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:${TAG_FROM_GIT_REF_NAME},mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/base:${TAG_FROM_GIT_REF_NAME}"
    ]
}

target "app" {
    dockerfile = "app.Dockerfile"
    contexts = {
        base = "target:base"
    }
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/app/cache:${TAG_FROM_GIT_REF_NAME}"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/app/cache:${TAG_FROM_GIT_REF_NAME},mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/app:${TAG_FROM_GIT_REF_NAME}"
    ]
}
