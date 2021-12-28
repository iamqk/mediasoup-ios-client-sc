//
//  Transport.mm
//  mediasoup-client-ios
//
//  Created by Ethan.
//  Copyright © 2019 Ethan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transport.h"
#import "TransportWrapper.h"

@implementation Transport : NSObject

-(instancetype)initWithNativeTransport:(NSValue *)nativeTransport {
    self = [super init];
    if (self) {
        self._nativeTransport = nativeTransport;
    }
    
    return self;
}

-(instancetype)initWithNativeTransportAndListener:(NSArray *)transportAndListener {
    self = [super init];
    if (self) {
        self._nativeTransport = transportAndListener[0];
        self._listener = transportAndListener[1];
    }
    
    return self;
}

-(NSString *)getId {
    return [TransportWrapper getNativeId:self._nativeTransport];
}

-(NSString *)getConnectionState {
    return [TransportWrapper getNativeConnectionState:self._nativeTransport];
}

-(NSString *)getAppData {
    return [TransportWrapper getNativeAppData:self._nativeTransport];
}

-(NSString *)getStats {
    return [TransportWrapper getNativeStats:self._nativeTransport];
}

-(bool)isClosed {
    return [TransportWrapper isNativeClosed:self._nativeTransport];
}

-(void)restartIce:(NSString *)iceParameters {
    [TransportWrapper nativeRestartIce:self._nativeTransport iceParameters:iceParameters];
}

-(void)updateIceServers:(NSString *)iceServers {
    [TransportWrapper nativeUpdateIceServers:self._nativeTransport iceServers:iceServers];
}

-(void)close {
    [self._nativeTransport retain];
    [TransportWrapper nativeClose:self._nativeTransport];
    [self._nativeTransport release];
}

-(void)dealloc {
    // not new by you, so do not free by you
//    if (self._nativeTransport != nil) {
//        [TransportWrapper nativeFreeTransport: self._nativeTransport];
//    }
    [self._nativeTransport release];
    
    if (self._listener != nil) {
        [TransportWrapper nativeFreeLisener: self._listener];
    }
    [self._listener release];

    [super dealloc];
}

@end
