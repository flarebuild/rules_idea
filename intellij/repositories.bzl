load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

_WORKER_PROTO_COMMIT = "c17f1b7f9b93bf034046d0973bf2b7e9a64815bf"
_WORKER_PROTO_SHA256 = "9e628d17d5e6ee0f9925576c0346ab1c452f94b6219bee00dbee3ff21d13b341"

_BAZEL_SKYLIB_VERSION = "1.1.1"
_BAZEL_SKYLIB_SHA256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d"
_BAZEL_SKYLIB_URLS = [ x.format(version = _BAZEL_SKYLIB_VERSION) for x in [
    "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz",
    "https://github.com/bazelbuild/bazel-skylib/releases/download/{version}/bazel-skylib-{version}.tar.gz",
]]

_PROTOBUF_VERSION = "3.19.2"
_PROTOBUF_SHA256 = "9ceef0daf7e8be16cd99ac759271eb08021b53b1c7b6edd399953a76390234cd"

_RULES_JVM_EXTERNAL_VERSION = "4.2"
_RULES_JVM_EXTERNAL_SHA256 = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"

_GRPC_JAVA_VERSION = "1.45.0"
_GRPC_JAVA_SHA256 = "0a2aebd9b4980c3d555246a27d365349aa9327acf1bc3ed3b545c3cc9594f2e9"
_GRPC_JAVA_URLS = [
    "https://github.com/grpc/grpc-java/archive/refs/tags/v{version}.zip",
]

_RULES_KOTLIN_VERSION = "1.5.0"
_RULES_KOTLIN_SHA256 = "12d22a3d9cbcf00f2e2d8f0683ba87d3823cb8c7f6837568dd7e48846e023307"

RULES_INTELLIJ_JAVA_ARTIFACTS = [
    "com.beust:jcommander:1.82",
]

def rules_intellij_repositories():
    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = _BAZEL_SKYLIB_SHA256,
        urls = _BAZEL_SKYLIB_URLS,
    )

    maybe(
        http_archive,
        name = "build_bazel_integration_testing",
        urls = [
            "https://github.com/bazelbuild/bazel-integration-testing/archive/165440b2dbda885f8d1ccb8d0f417e6cf8c54f17.zip",
        ],
        strip_prefix = "bazel-integration-testing-165440b2dbda885f8d1ccb8d0f417e6cf8c54f17",
        sha256 = "2401b1369ef44cc42f91dc94443ef491208dbd06da1e1e10b702d8c189f098e3",
    )

    maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "2b1641428dff9018f9e85c0384f03ec6c10660d935b750e3fa1492a281a53b0f",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.29.0/rules_go-v0.29.0.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.29.0/rules_go-v0.29.0.zip",
        ],
    )

    maybe(
        http_archive,
        name = "bazel_gazelle",
        sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "io_bazel_rules_kotlin",
        urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/v%s/rules_kotlin_release.tgz" % _RULES_KOTLIN_VERSION],
        sha256 = _RULES_KOTLIN_SHA256,
    )
    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = _PROTOBUF_SHA256,
        strip_prefix = "protobuf-%s" % _PROTOBUF_VERSION,
        urls = ["https://github.com/protocolbuffers/protobuf/archive/v%s.zip" % _PROTOBUF_VERSION],
    )
    maybe(
        http_archive,
        name = "rules_jvm_external",
        sha256 = _RULES_JVM_EXTERNAL_SHA256,
        strip_prefix = "rules_jvm_external-%s" % _RULES_JVM_EXTERNAL_VERSION,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % _RULES_JVM_EXTERNAL_VERSION,
    )

    maybe(
        http_archive,
        name = "io_grpc_grpc_java",
        sha256 = _GRPC_JAVA_SHA256,
        strip_prefix = "grpc-java-%s" % _GRPC_JAVA_VERSION,
        urls = [ x.format(version = _GRPC_JAVA_VERSION) for x in _GRPC_JAVA_URLS ],
    )    
    http_file(
        name = "workers_proto",
        urls = ["https://raw.githubusercontent.com/bazelbuild/bazel/%s/src/main/protobuf/worker_protocol.proto" % _WORKER_PROTO_COMMIT ],
        sha256 = _WORKER_PROTO_SHA256,
    )