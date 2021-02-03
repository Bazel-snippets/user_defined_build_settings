load("@bazel_skylib//rules:common_settings.bzl", "BuildSettingInfo")

def _second_rule_impl(ctx):
    setting_value = ctx.attr._san[BuildSettingInfo].value

    print('Second rule received "%s"' % setting_value)

    file = ctx.actions.declare_file(ctx.label.name + setting_value)
    ctx.actions.write(file, setting_value) 

    return DefaultInfo(files = depset([file]))

second_rule = rule(
    implementation = _second_rule_impl,
    attrs = {
        "_san": attr.label(default = "//:second_flag"),
    },
)