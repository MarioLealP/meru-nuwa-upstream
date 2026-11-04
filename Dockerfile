# Someone else's app, as our own image: the build signs it with this app's key, so it passes Meru's rules like any other.
# Keep this one line pinned to a digest (CI refuses anything else). An upgrade is a PR that changes it.
FROM docker.io/library/busybox:1.37.0@sha256:0000000000000000000000000000000000000000000000000000000000000000
