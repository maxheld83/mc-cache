target "foo" {
    dockerfile = "foo.Dockerfile"
}

target "bar" {
    dockerfile = "bar.Dockerfile"
    contexts = {
        foo = "target:foo"
    }
    cache-from = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/bar/cache"
    ]
    cache-to = [
        "type=registry,ref=ghcr.io/maxheld83/mc-cache/bar/cache,mode=max"
    ]
    tags = [
        "ghcr.io/maxheld83/mc-cache/bar"
    ]
}