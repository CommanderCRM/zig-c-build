const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "digitalroot",
        .root_module = b.createModule(.{
            .target = b.standardTargetOptions(.{}),
            .optimize = b.standardOptimizeOption(.{}),
        }),
    });

    exe.addCSourceFiles(.{ .root = b.path("src"), .files = &.{"digitalroot.c"} });
    exe.linkLibC();

    b.installArtifact(exe);
}
