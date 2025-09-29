plugins {
    id("com.google.gms.google-services") // Google Services Plugin
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Flutter Gradle Plugin
}

android {
    namespace = "com.example.expensesTracker"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.expensesTracker"  // Uygulamanızın benzersiz ID'si
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    implementation("com.google.firebase:firebase-core:20.1.0")  // Firebase Core
    implementation("com.google.firebase:firebase-auth:21.0.1")  // Firebase Authentication (gerekiyorsa)
    implementation("com.google.firebase:firebase-firestore:24.0.0")  // Firebase Firestore (gerekiyorsa)
}

flutter {
    source = "../.."
}
