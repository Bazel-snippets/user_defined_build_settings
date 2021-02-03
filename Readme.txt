Works as expected:

    bazel build first --//:first_flag=ff1

    bazel build first --@//:first_flag=ff1


Using explicit workspace name in the flag target is broken:

    bazel build first --@first//:first_flag=ff1

    What is given after the equal sign is ignored and the value of the flag is ALWAYS what is specified as build_setting_default.


Using explicit workspace name from ANOTHER workspace works again:

    bazel build @second//:second --@second//:second_flag=sf1

