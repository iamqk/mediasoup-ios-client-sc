#!/bin/sh
mv combined/mediasoup_client_ios.framework/Frameworks/WebRTC.framework ./
lipo -create arm64/mediasoup_client_ios.framework/mediasoup_client_ios x86_64/mediasoup_client_ios.framework/mediasoup_client_ios -output combined/mediasoup_client_ios
cp -r arm64/mediasoup_client_ios.framework combined
cp combined/mediasoup_client_ios combined/mediasoup_client_ios.framework/
mkdir combined/mediasoup_client_ios.framework/Frameworks
mv ./WebRTC.framework combined/mediasoup_client_ios.framework/Frameworks/
