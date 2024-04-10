#!/bin/bash

create_xcframework() {
    local library_name=$1
    local framework_name=$2
    local framework_path="dist/frameworks/$framework_name.xcframework"
    
    xcodebuild -create-xcframework \
        -library "dist/lib/iphone/lib$library_name.a" -headers "$framework_path/Versions/A/Headers" \
        -library "dist/lib/simulator/lib$library_name.a" -headers "$framework_path/Versions/A/Headers" \
        -output "$framework_name.xcframework"
}

create_xcframework "jre_emul" "JRE"
create_xcframework "jsr305" "JSR305"
create_xcframework "javax_inject" "JavaxInject"