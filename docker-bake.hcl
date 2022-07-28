target "base" {
    dockerfile = "base.Dockerfile"
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:latest"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/base/cache:latest,mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/base:latest"
    ]
}

target "app" {
    dockerfile = "app.Dockerfile"
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/app/cache:latest"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/app/cache:latest,mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/app:latest"
    ]
}