    apply plugin: 'com.android.library'

    def DEFAULT_COMPILE_SDK_VERSION = 23
    def DEFAULT_BUILD_TOOLS_VERSION = "23.0.1"
    def DEFAULT_TARGET_SDK_VERSION = 22
    def DEFAULT_SUPPORT_LIB_VERSION = "23.1.0"

    android {
        compileSdkVersion 23
        buildToolsVersion "23.0.1"
        compileSdkVersion rootProject.hasProperty('compileSdkVersion') ? rootProject.compileSdkVersion : DEFAULT_COMPILE_SDK_VERSION
        buildToolsVersion rootProject.hasProperty('buildToolsVersion') ? rootProject.buildToolsVersion : DEFAULT_BUILD_TOOLS_VERSION

        defaultConfig {
            minSdkVersion 16
            targetSdkVersion 22
            targetSdkVersion rootProject.hasProperty('targetSdkVersion') ? rootProject.targetSdkVersion : DEFAULT_TARGET_SDK_VERSION
            versionCode 1
            versionName "1.0"
        }
        repositories {
            mavenCentral()
        }

        def supportVersion = rootProject.hasProperty('supportLibVersion') ? rootProject.supportLibVersion : DEFAULT_SUPPORT_LIB_VERSION


        dependencies {
            compile fileTree(dir: 'libs', include: ['*.jar'])
            compile 'com.android.support:appcompat-v7:${supportVersion}'
            compile 'com.facebook.react:react-native:+'
        }
    }    
