target "foo" {
    dockerfile = "foo.Dockerfile"
}

target "bar" {
    dockerfile = "bar.Dockerfile"
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/bar/cache:latest"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/bar/cache:latest,mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/bar:latest"
    ]
}