#!/bin/sh
lipo -create arm64/mediasoup_client_ios.framework/mediasoup_client_ios x86_64/mediasoup_client_ios.framework/mediasoup_client_ios -output combined/mediasoup_client_ios
cp -r arm64/mediasoup_client_ios.framework combined
cp combined/mediasoup_client_ios combined/mediasoup_client_ios.framework/
