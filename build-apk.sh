#!/bin/bash

echo "🚀 Starting One-Click APK Build..."

# Install dependencies
sudo apt update
sudo apt install -y openjdk-17-jdk wget unzip

# Set Android SDK
export ANDROID_HOME=$HOME/android-sdk
mkdir -p $ANDROID_HOME
cd $ANDROID_HOME

# Download command line tools
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip -o commandlinetools-linux-*.zip

export PATH=$ANDROID_HOME/cmdline-tools/bin:$PATH

# Accept licenses
yes | sdkmanager --licenses

# Install SDK components
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# Build project
cd ~/workspace || cd .
./gradlew assembleDebug

echo "✅ BUILD COMPLETE!"
echo "📦 APK LOCATION:"
echo "app/build/outputs/apk/debug/app-debug.apk"
