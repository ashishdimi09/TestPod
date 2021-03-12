#!/bin/sh

BUILD_DIR="${PROJECT_DIR}/build"
rm -rf "${BUILD_DIR}"

FINAL_PRODUCTS_DIR="${BUILD_DIR}/Lemnisk"
ARCHIVE_DIR="${BUILD_DIR}/archive"

mkdir -p ${ARCHIVE_DIR}
mkdir -p ${FINAL_PRODUCTS_DIR}

build()
{

cd ${PROJECT_DIR}

rm -rf ${ARCHIVE_DIR}

SCHEME_NAME=$1
FRAMEWORK_NAME="${SCHEME_NAME}.framework"
FRAMEWORK_DIR="${ARCHIVE_DIR}/${FRAMEWORK_NAME}"

xcodebuild archive \
-scheme ${SCHEME_NAME} \
-configuration Release \
-destination "generic/platform=iOS" \
-archivePath "${FRAMEWORK_DIR}-iphoneos.xcarchive" \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme ${SCHEME_NAME} \
-configuration Release \
-destination "generic/platform=iOS Simulator" \
-archivePath "${FRAMEWORK_DIR}-iphonesimulator.xcarchive" \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme ${SCHEME_NAME} \
-configuration Release \
-destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst' \
-archivePath "${FRAMEWORK_DIR}-macos.xcarchive" \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework "${FRAMEWORK_DIR}-iphoneos.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}" \
-framework "${FRAMEWORK_DIR}-iphonesimulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}" \
-framework "${FRAMEWORK_DIR}-macos.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}" \
-output "${FINAL_PRODUCTS_DIR}/${SCHEME_NAME}.xcframework"

cd "${FINAL_PRODUCTS_DIR}/${SCHEME_NAME}.xcframework" && \
find . -name "*.swiftinterface" -exec sed -i -e "s/${SCHEME_NAME}\.//g" {} \;
}

build "Lemnisk"
build "LemniskRichNotification"
build "LemniskNotificationContent"

rm -r ${ARCHIVE_DIR}

# Convenience step to open the project's directory in Finder
open ${FINAL_PRODUCTS_DIR}
