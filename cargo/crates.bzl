"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__addr2line__0_17_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.17.0/download",
        type = "tar.gz",
        strip_prefix = "addr2line-0.17.0",
        build_file = Label("//cargo/remote:BUILD.addr2line-0.17.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__adler__1_0_2",
        url = "https://crates.io/api/v1/crates/adler/1.0.2/download",
        type = "tar.gz",
        strip_prefix = "adler-1.0.2",
        build_file = Label("//cargo/remote:BUILD.adler-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ahash__0_7_6",
        url = "https://crates.io/api/v1/crates/ahash/0.7.6/download",
        type = "tar.gz",
        strip_prefix = "ahash-0.7.6",
        build_file = Label("//cargo/remote:BUILD.ahash-0.7.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_1_0",
        url = "https://crates.io/api/v1/crates/autocfg/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "autocfg-1.1.0",
        build_file = Label("//cargo/remote:BUILD.autocfg-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__backtrace__0_3_66",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.66/download",
        type = "tar.gz",
        strip_prefix = "backtrace-0.3.66",
        build_file = Label("//cargo/remote:BUILD.backtrace-0.3.66.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//cargo/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bumpalo__3_11_1",
        url = "https://crates.io/api/v1/crates/bumpalo/3.11.1/download",
        type = "tar.gz",
        strip_prefix = "bumpalo-3.11.1",
        build_file = Label("//cargo/remote:BUILD.bumpalo-3.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytecheck__0_6_9",
        url = "https://crates.io/api/v1/crates/bytecheck/0.6.9/download",
        type = "tar.gz",
        strip_prefix = "bytecheck-0.6.9",
        build_file = Label("//cargo/remote:BUILD.bytecheck-0.6.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytecheck_derive__0_6_9",
        url = "https://crates.io/api/v1/crates/bytecheck_derive/0.6.9/download",
        type = "tar.gz",
        strip_prefix = "bytecheck_derive-0.6.9",
        build_file = Label("//cargo/remote:BUILD.bytecheck_derive-0.6.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//cargo/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytes__1_3_0",
        url = "https://crates.io/api/v1/crates/bytes/1.3.0/download",
        type = "tar.gz",
        strip_prefix = "bytes-1.3.0",
        build_file = Label("//cargo/remote:BUILD.bytes-1.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_77",
        url = "https://crates.io/api/v1/crates/cc/1.0.77/download",
        type = "tar.gz",
        strip_prefix = "cc-1.0.77",
        build_file = Label("//cargo/remote:BUILD.cc-1.0.77.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__corosensei__0_1_3",
        url = "https://crates.io/api/v1/crates/corosensei/0.1.3/download",
        type = "tar.gz",
        strip_prefix = "corosensei-0.1.3",
        build_file = Label("//cargo/remote:BUILD.corosensei-0.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_bforest__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-bforest-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-bforest-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_codegen__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-codegen-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-codegen-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_codegen_meta__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-codegen-meta-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-codegen-meta-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_codegen_shared__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-codegen-shared-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-codegen-shared-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_entity__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-entity-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-entity-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_frontend__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-frontend-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-frontend-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cranelift_isle__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.86.1/download",
        type = "tar.gz",
        strip_prefix = "cranelift-isle-0.86.1",
        build_file = Label("//cargo/remote:BUILD.cranelift-isle-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_channel__0_5_6",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.6/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-channel-0.5.6",
        build_file = Label("//cargo/remote:BUILD.crossbeam-channel-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_deque__0_8_2",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.2/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-deque-0.8.2",
        build_file = Label("//cargo/remote:BUILD.crossbeam-deque-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_epoch__0_9_13",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.13/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-epoch-0.9.13",
        build_file = Label("//cargo/remote:BUILD.crossbeam-epoch-0.9.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_8_14",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.14/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-utils-0.8.14",
        build_file = Label("//cargo/remote:BUILD.crossbeam-utils-0.8.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__darling__0_14_2",
        url = "https://crates.io/api/v1/crates/darling/0.14.2/download",
        type = "tar.gz",
        strip_prefix = "darling-0.14.2",
        build_file = Label("//cargo/remote:BUILD.darling-0.14.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__darling_core__0_14_2",
        url = "https://crates.io/api/v1/crates/darling_core/0.14.2/download",
        type = "tar.gz",
        strip_prefix = "darling_core-0.14.2",
        build_file = Label("//cargo/remote:BUILD.darling_core-0.14.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__darling_macro__0_14_2",
        url = "https://crates.io/api/v1/crates/darling_macro/0.14.2/download",
        type = "tar.gz",
        strip_prefix = "darling_macro-0.14.2",
        build_file = Label("//cargo/remote:BUILD.darling_macro-0.14.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_8_0",
        url = "https://crates.io/api/v1/crates/either/1.8.0/download",
        type = "tar.gz",
        strip_prefix = "either-1.8.0",
        build_file = Label("//cargo/remote:BUILD.either-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__enum_iterator__0_7_0",
        url = "https://crates.io/api/v1/crates/enum-iterator/0.7.0/download",
        type = "tar.gz",
        strip_prefix = "enum-iterator-0.7.0",
        build_file = Label("//cargo/remote:BUILD.enum-iterator-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__enum_iterator_derive__0_7_0",
        url = "https://crates.io/api/v1/crates/enum-iterator-derive/0.7.0/download",
        type = "tar.gz",
        strip_prefix = "enum-iterator-derive-0.7.0",
        build_file = Label("//cargo/remote:BUILD.enum-iterator-derive-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__enumset__1_0_12",
        url = "https://crates.io/api/v1/crates/enumset/1.0.12/download",
        type = "tar.gz",
        strip_prefix = "enumset-1.0.12",
        build_file = Label("//cargo/remote:BUILD.enumset-1.0.12.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__enumset_derive__0_6_1",
        url = "https://crates.io/api/v1/crates/enumset_derive/0.6.1/download",
        type = "tar.gz",
        strip_prefix = "enumset_derive-0.6.1",
        build_file = Label("//cargo/remote:BUILD.enumset_derive-0.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//cargo/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fnv__1_0_7",
        url = "https://crates.io/api/v1/crates/fnv/1.0.7/download",
        type = "tar.gz",
        strip_prefix = "fnv-1.0.7",
        build_file = Label("//cargo/remote:BUILD.fnv-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fxhash__0_2_1",
        url = "https://crates.io/api/v1/crates/fxhash/0.2.1/download",
        type = "tar.gz",
        strip_prefix = "fxhash-0.2.1",
        build_file = Label("//cargo/remote:BUILD.fxhash-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_2_8",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.8/download",
        type = "tar.gz",
        strip_prefix = "getrandom-0.2.8",
        build_file = Label("//cargo/remote:BUILD.getrandom-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gimli__0_26_2",
        url = "https://crates.io/api/v1/crates/gimli/0.26.2/download",
        type = "tar.gz",
        strip_prefix = "gimli-0.26.2",
        build_file = Label("//cargo/remote:BUILD.gimli-0.26.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hashbrown__0_12_3",
        url = "https://crates.io/api/v1/crates/hashbrown/0.12.3/download",
        type = "tar.gz",
        strip_prefix = "hashbrown-0.12.3",
        build_file = Label("//cargo/remote:BUILD.hashbrown-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_19",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.19/download",
        type = "tar.gz",
        strip_prefix = "hermit-abi-0.1.19",
        build_file = Label("//cargo/remote:BUILD.hermit-abi-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ident_case__1_0_1",
        url = "https://crates.io/api/v1/crates/ident_case/1.0.1/download",
        type = "tar.gz",
        strip_prefix = "ident_case-1.0.1",
        build_file = Label("//cargo/remote:BUILD.ident_case-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_9_2",
        url = "https://crates.io/api/v1/crates/indexmap/1.9.2/download",
        type = "tar.gz",
        strip_prefix = "indexmap-1.9.2",
        build_file = Label("//cargo/remote:BUILD.indexmap-1.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__js_sys__0_3_60",
        url = "https://crates.io/api/v1/crates/js-sys/0.3.60/download",
        type = "tar.gz",
        strip_prefix = "js-sys-0.3.60",
        build_file = Label("//cargo/remote:BUILD.js-sys-0.3.60.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__leb128__0_2_5",
        url = "https://crates.io/api/v1/crates/leb128/0.2.5/download",
        type = "tar.gz",
        strip_prefix = "leb128-0.2.5",
        build_file = Label("//cargo/remote:BUILD.leb128-0.2.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_137",
        url = "https://crates.io/api/v1/crates/libc/0.2.137/download",
        type = "tar.gz",
        strip_prefix = "libc-0.2.137",
        build_file = Label("//cargo/remote:BUILD.libc-0.2.137.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_17",
        url = "https://crates.io/api/v1/crates/log/0.4.17/download",
        type = "tar.gz",
        strip_prefix = "log-0.4.17",
        build_file = Label("//cargo/remote:BUILD.log-0.4.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mach__0_3_2",
        url = "https://crates.io/api/v1/crates/mach/0.3.2/download",
        type = "tar.gz",
        strip_prefix = "mach-0.3.2",
        build_file = Label("//cargo/remote:BUILD.mach-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_5_0",
        url = "https://crates.io/api/v1/crates/memchr/2.5.0/download",
        type = "tar.gz",
        strip_prefix = "memchr-2.5.0",
        build_file = Label("//cargo/remote:BUILD.memchr-2.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memmap2__0_5_8",
        url = "https://crates.io/api/v1/crates/memmap2/0.5.8/download",
        type = "tar.gz",
        strip_prefix = "memmap2-0.5.8",
        build_file = Label("//cargo/remote:BUILD.memmap2-0.5.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_6_5",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.5/download",
        type = "tar.gz",
        strip_prefix = "memoffset-0.6.5",
        build_file = Label("//cargo/remote:BUILD.memoffset-0.6.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_7_1",
        url = "https://crates.io/api/v1/crates/memoffset/0.7.1/download",
        type = "tar.gz",
        strip_prefix = "memoffset-0.7.1",
        build_file = Label("//cargo/remote:BUILD.memoffset-0.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miniz_oxide__0_5_4",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.5.4/download",
        type = "tar.gz",
        strip_prefix = "miniz_oxide-0.5.4",
        build_file = Label("//cargo/remote:BUILD.miniz_oxide-0.5.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__more_asserts__0_2_2",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.2/download",
        type = "tar.gz",
        strip_prefix = "more-asserts-0.2.2",
        build_file = Label("//cargo/remote:BUILD.more-asserts-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_14_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.14.0/download",
        type = "tar.gz",
        strip_prefix = "num_cpus-1.14.0",
        build_file = Label("//cargo/remote:BUILD.num_cpus-1.14.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__object__0_29_0",
        url = "https://crates.io/api/v1/crates/object/0.29.0/download",
        type = "tar.gz",
        strip_prefix = "object-0.29.0",
        build_file = Label("//cargo/remote:BUILD.object-0.29.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_16_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.16.0/download",
        type = "tar.gz",
        strip_prefix = "once_cell-1.16.0",
        build_file = Label("//cargo/remote:BUILD.once_cell-1.16.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_lite__0_2_9",
        url = "https://crates.io/api/v1/crates/pin-project-lite/0.2.9/download",
        type = "tar.gz",
        strip_prefix = "pin-project-lite-0.2.9",
        build_file = Label("//cargo/remote:BUILD.pin-project-lite-0.2.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_error__1_0_4",
        url = "https://crates.io/api/v1/crates/proc-macro-error/1.0.4/download",
        type = "tar.gz",
        strip_prefix = "proc-macro-error-1.0.4",
        build_file = Label("//cargo/remote:BUILD.proc-macro-error-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro_error_attr__1_0_4",
        url = "https://crates.io/api/v1/crates/proc-macro-error-attr/1.0.4/download",
        type = "tar.gz",
        strip_prefix = "proc-macro-error-attr-1.0.4",
        build_file = Label("//cargo/remote:BUILD.proc-macro-error-attr-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_47",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.47/download",
        type = "tar.gz",
        strip_prefix = "proc-macro2-1.0.47",
        build_file = Label("//cargo/remote:BUILD.proc-macro2-1.0.47.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ptr_meta__0_1_4",
        url = "https://crates.io/api/v1/crates/ptr_meta/0.1.4/download",
        type = "tar.gz",
        strip_prefix = "ptr_meta-0.1.4",
        build_file = Label("//cargo/remote:BUILD.ptr_meta-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ptr_meta_derive__0_1_4",
        url = "https://crates.io/api/v1/crates/ptr_meta_derive/0.1.4/download",
        type = "tar.gz",
        strip_prefix = "ptr_meta_derive-0.1.4",
        build_file = Label("//cargo/remote:BUILD.ptr_meta_derive-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_21",
        url = "https://crates.io/api/v1/crates/quote/1.0.21/download",
        type = "tar.gz",
        strip_prefix = "quote-1.0.21",
        build_file = Label("//cargo/remote:BUILD.quote-1.0.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon__1_6_0",
        url = "https://crates.io/api/v1/crates/rayon/1.6.0/download",
        type = "tar.gz",
        strip_prefix = "rayon-1.6.0",
        build_file = Label("//cargo/remote:BUILD.rayon-1.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon_core__1_10_1",
        url = "https://crates.io/api/v1/crates/rayon-core/1.10.1/download",
        type = "tar.gz",
        strip_prefix = "rayon-core-1.10.1",
        build_file = Label("//cargo/remote:BUILD.rayon-core-1.10.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regalloc2__0_3_2",
        url = "https://crates.io/api/v1/crates/regalloc2/0.3.2/download",
        type = "tar.gz",
        strip_prefix = "regalloc2-0.3.2",
        build_file = Label("//cargo/remote:BUILD.regalloc2-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__region__3_0_0",
        url = "https://crates.io/api/v1/crates/region/3.0.0/download",
        type = "tar.gz",
        strip_prefix = "region-3.0.0",
        build_file = Label("//cargo/remote:BUILD.region-3.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rend__0_3_6",
        url = "https://crates.io/api/v1/crates/rend/0.3.6/download",
        type = "tar.gz",
        strip_prefix = "rend-0.3.6",
        build_file = Label("//cargo/remote:BUILD.rend-0.3.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rkyv__0_7_39",
        url = "https://crates.io/api/v1/crates/rkyv/0.7.39/download",
        type = "tar.gz",
        strip_prefix = "rkyv-0.7.39",
        build_file = Label("//cargo/remote:BUILD.rkyv-0.7.39.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rkyv_derive__0_7_39",
        url = "https://crates.io/api/v1/crates/rkyv_derive/0.7.39/download",
        type = "tar.gz",
        strip_prefix = "rkyv_derive-0.7.39",
        build_file = Label("//cargo/remote:BUILD.rkyv_derive-0.7.39.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_demangle__0_1_21",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.21/download",
        type = "tar.gz",
        strip_prefix = "rustc-demangle-0.1.21",
        build_file = Label("//cargo/remote:BUILD.rustc-demangle-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__seahash__4_1_0",
        url = "https://crates.io/api/v1/crates/seahash/4.1.0/download",
        type = "tar.gz",
        strip_prefix = "seahash-4.1.0",
        build_file = Label("//cargo/remote:BUILD.seahash-4.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_148",
        url = "https://crates.io/api/v1/crates/serde/1.0.148/download",
        type = "tar.gz",
        strip_prefix = "serde-1.0.148",
        build_file = Label("//cargo/remote:BUILD.serde-1.0.148.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_wasm_bindgen__0_4_5",
        url = "https://crates.io/api/v1/crates/serde-wasm-bindgen/0.4.5/download",
        type = "tar.gz",
        strip_prefix = "serde-wasm-bindgen-0.4.5",
        build_file = Label("//cargo/remote:BUILD.serde-wasm-bindgen-0.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_148",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.148/download",
        type = "tar.gz",
        strip_prefix = "serde_derive-1.0.148",
        build_file = Label("//cargo/remote:BUILD.serde_derive-1.0.148.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slice_group_by__0_3_0",
        url = "https://crates.io/api/v1/crates/slice-group-by/0.3.0/download",
        type = "tar.gz",
        strip_prefix = "slice-group-by-0.3.0",
        build_file = Label("//cargo/remote:BUILD.slice-group-by-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_10_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.10.0/download",
        type = "tar.gz",
        strip_prefix = "smallvec-1.10.0",
        build_file = Label("//cargo/remote:BUILD.smallvec-1.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stable_deref_trait__1_2_0",
        url = "https://crates.io/api/v1/crates/stable_deref_trait/1.2.0/download",
        type = "tar.gz",
        strip_prefix = "stable_deref_trait-1.2.0",
        build_file = Label("//cargo/remote:BUILD.stable_deref_trait-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_104",
        url = "https://crates.io/api/v1/crates/syn/1.0.104/download",
        type = "tar.gz",
        strip_prefix = "syn-1.0.104",
        build_file = Label("//cargo/remote:BUILD.syn-1.0.104.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__target_lexicon__0_12_5",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.5/download",
        type = "tar.gz",
        strip_prefix = "target-lexicon-0.12.5",
        build_file = Label("//cargo/remote:BUILD.target-lexicon-0.12.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_37",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.37/download",
        type = "tar.gz",
        strip_prefix = "thiserror-1.0.37",
        build_file = Label("//cargo/remote:BUILD.thiserror-1.0.37.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_37",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.37/download",
        type = "tar.gz",
        strip_prefix = "thiserror-impl-1.0.37",
        build_file = Label("//cargo/remote:BUILD.thiserror-impl-1.0.37.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing__0_1_37",
        url = "https://crates.io/api/v1/crates/tracing/0.1.37/download",
        type = "tar.gz",
        strip_prefix = "tracing-0.1.37",
        build_file = Label("//cargo/remote:BUILD.tracing-0.1.37.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_attributes__0_1_23",
        url = "https://crates.io/api/v1/crates/tracing-attributes/0.1.23/download",
        type = "tar.gz",
        strip_prefix = "tracing-attributes-0.1.23",
        build_file = Label("//cargo/remote:BUILD.tracing-attributes-0.1.23.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_core__0_1_30",
        url = "https://crates.io/api/v1/crates/tracing-core/0.1.30/download",
        type = "tar.gz",
        strip_prefix = "tracing-core-0.1.30",
        build_file = Label("//cargo/remote:BUILD.tracing-core-0.1.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_ident__1_0_5",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.5/download",
        type = "tar.gz",
        strip_prefix = "unicode-ident-1.0.5",
        build_file = Label("//cargo/remote:BUILD.unicode-ident-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_width__0_1_10",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.10/download",
        type = "tar.gz",
        strip_prefix = "unicode-width-0.1.10",
        build_file = Label("//cargo/remote:BUILD.unicode-width-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__version_check__0_9_4",
        url = "https://crates.io/api/v1/crates/version_check/0.9.4/download",
        type = "tar.gz",
        strip_prefix = "version_check-0.9.4",
        build_file = Label("//cargo/remote:BUILD.version_check-0.9.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_11_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.11.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        strip_prefix = "wasi-0.11.0+wasi-snapshot-preview1",
        build_file = Label("//cargo/remote:BUILD.wasi-0.11.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen__0_2_83",
        url = "https://crates.io/api/v1/crates/wasm-bindgen/0.2.83/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-0.2.83",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-0.2.83.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_backend__0_2_83",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.83/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-backend-0.2.83",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-backend-0.2.83.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro__0_2_83",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.83/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-0.2.83",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-macro-0.2.83.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro_support__0_2_83",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.83/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-support-0.2.83",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-macro-support-0.2.83.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_shared__0_2_83",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.83/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-shared-0.2.83",
        build_file = Label("//cargo/remote:BUILD.wasm-bindgen-shared-0.2.83.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_encoder__0_20_0",
        url = "https://crates.io/api/v1/crates/wasm-encoder/0.20.0/download",
        type = "tar.gz",
        strip_prefix = "wasm-encoder-0.20.0",
        build_file = Label("//cargo/remote:BUILD.wasm-encoder-0.20.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmer__3_0_2",
        url = "https://crates.io/api/v1/crates/wasmer/3.0.2/download",
        type = "tar.gz",
        strip_prefix = "wasmer-3.0.2",
        build_file = Label("//cargo/remote:BUILD.wasmer-3.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmer_compiler__3_0_2",
        url = "https://crates.io/api/v1/crates/wasmer-compiler/3.0.2/download",
        type = "tar.gz",
        strip_prefix = "wasmer-compiler-3.0.2",
        build_file = Label("//cargo/remote:BUILD.wasmer-compiler-3.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmer_compiler_cranelift__3_0_2",
        url = "https://crates.io/api/v1/crates/wasmer-compiler-cranelift/3.0.2/download",
        type = "tar.gz",
        strip_prefix = "wasmer-compiler-cranelift-3.0.2",
        build_file = Label("//cargo/remote:BUILD.wasmer-compiler-cranelift-3.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmer_derive__3_0_2",
        url = "https://crates.io/api/v1/crates/wasmer-derive/3.0.2/download",
        type = "tar.gz",
        strip_prefix = "wasmer-derive-3.0.2",
        build_file = Label("//cargo/remote:BUILD.wasmer-derive-3.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmer_types__3_0_2",
        url = "https://crates.io/api/v1/crates/wasmer-types/3.0.2/download",
        type = "tar.gz",
        strip_prefix = "wasmer-types-3.0.2",
        build_file = Label("//cargo/remote:BUILD.wasmer-types-3.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmer_vm__3_0_2",
        url = "https://crates.io/api/v1/crates/wasmer-vm/3.0.2/download",
        type = "tar.gz",
        strip_prefix = "wasmer-vm-3.0.2",
        build_file = Label("//cargo/remote:BUILD.wasmer-vm-3.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmparser__0_83_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.83.0/download",
        type = "tar.gz",
        strip_prefix = "wasmparser-0.83.0",
        build_file = Label("//cargo/remote:BUILD.wasmparser-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wast__50_0_0",
        url = "https://crates.io/api/v1/crates/wast/50.0.0/download",
        type = "tar.gz",
        strip_prefix = "wast-50.0.0",
        build_file = Label("//cargo/remote:BUILD.wast-50.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wat__1_0_52",
        url = "https://crates.io/api/v1/crates/wat/1.0.52/download",
        type = "tar.gz",
        strip_prefix = "wat-1.0.52",
        build_file = Label("//cargo/remote:BUILD.wat-1.0.52.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_sys__0_33_0",
        url = "https://crates.io/api/v1/crates/windows-sys/0.33.0/download",
        type = "tar.gz",
        strip_prefix = "windows-sys-0.33.0",
        build_file = Label("//cargo/remote:BUILD.windows-sys-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_aarch64_msvc__0_33_0",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.33.0/download",
        type = "tar.gz",
        strip_prefix = "windows_aarch64_msvc-0.33.0",
        build_file = Label("//cargo/remote:BUILD.windows_aarch64_msvc-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_i686_gnu__0_33_0",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.33.0/download",
        type = "tar.gz",
        strip_prefix = "windows_i686_gnu-0.33.0",
        build_file = Label("//cargo/remote:BUILD.windows_i686_gnu-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_i686_msvc__0_33_0",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.33.0/download",
        type = "tar.gz",
        strip_prefix = "windows_i686_msvc-0.33.0",
        build_file = Label("//cargo/remote:BUILD.windows_i686_msvc-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_gnu__0_33_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.33.0/download",
        type = "tar.gz",
        strip_prefix = "windows_x86_64_gnu-0.33.0",
        build_file = Label("//cargo/remote:BUILD.windows_x86_64_gnu-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_msvc__0_33_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.33.0/download",
        type = "tar.gz",
        strip_prefix = "windows_x86_64_msvc-0.33.0",
        build_file = Label("//cargo/remote:BUILD.windows_x86_64_msvc-0.33.0.bazel"),
    )
