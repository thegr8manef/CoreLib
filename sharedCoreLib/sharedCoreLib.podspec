Pod::Spec.new do |spec|
    spec.name                     = 'sharedCoreLib'
    spec.version                  = '1.1.0'
    spec.homepage                 = 'https://github.com/thegr8manef/CoreLib'
    spec.source                   = { :git=> 'https://github.com/thegr8manef/CoreLib.git', :tag => '1.1.0'}
    spec.authors                  = 'Thegr8manef, Manef Jedidi'
    spec.license                  = 'Apache-2.0'
    spec.summary                  = 'CoreLib'
    spec.vendored_frameworks      = 'build/cocoapods/framework/CoreLib.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '14.1'
                
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':sharedCoreLib',
        'PRODUCT_MODULE_NAME' => 'CoreLib',
    }
                
    spec.script_phases = [
        {
            :name => 'Build sharedCoreLib',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end