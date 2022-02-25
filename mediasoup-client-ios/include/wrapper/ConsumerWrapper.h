//
//  ConsumerWrapper.h
//  mediasoup-client-ios
//
//  Created by Ethan.
//  Copyright © 2019 Ethan. All rights reserved.
//
#import "Consumer.hpp"
#import "Consumer.h"

#ifndef ConsumerWrapper_h
#define ConsumerWrapper_h

@interface ConsumerWrapper : NSObject {}
+(void)nativeFreeConsumer:(NSValue *)nativeDevice;
+(NSString *)getNativeId:(NSValue *)nativeConsumer;
+(NSString *)getNativeProducerId:(NSValue *)nativeConsumer;
+(bool)isNativeClosed:(NSValue *)nativeConsumer;
+(bool)isNativePaused:(NSValue *)nativeConsumer;
+(NSString *)getNativeKind:(NSValue *)nativeConsumer;
+(webrtc::MediaStreamTrackInterface *)getNativeTrack:(NSValue *)nativeConsumer;
+(NSString *)getNativeRtpParameters:(NSValue *)nativeConsumer;
+(NSString *)getNativeAppData:(NSValue *)nativeConsumer;
+(void)nativeResume:(NSValue *)nativeConsumer;
+(void)nativePause:(NSValue *)nativeConsumer;
+(NSString *)getNativeStats:(NSValue *)nativeConsumer;
+(void)nativeClose:(NSValue *)nativeConsumer;

@end

class ConsumerListenerWrapper final : public mediasoupclient::Consumer::Listener {
private:
    Protocol<ConsumerListener>* listener_;
    ::Consumer* consumer_;
public:
    ConsumerListenerWrapper(Protocol<ConsumerListener>* listener)
    : listener_(listener) {
        [listener_ retain];
    }
    
    ~ConsumerListenerWrapper() {
//        [consumer_ release];
        [listener_ release];
    }
    
    ConsumerListenerWrapper(const ConsumerListenerWrapper &obj) {
        [obj.listener_ retain];
        [obj.consumer_ retain];
        this->listener_ = obj.listener_;
        this->consumer_ = obj.consumer_;
    }
    
    void OnTransportClose(mediasoupclient::Consumer* nativeConsumer) override {
        [this->listener_ onTransportClose:this->consumer_];
    };
    
    void SetConsumer(::Consumer *consumer) {
        this->consumer_ = consumer;
    }
};

class OwnedConsumer {
public:
    OwnedConsumer(mediasoupclient::Consumer* consumer, ConsumerListenerWrapper* listener)
    : consumer_(consumer), listener_(listener) {}
    
    ~OwnedConsumer() {
        delete consumer_;
        delete listener_;
    };
    
    mediasoupclient::Consumer *consumer() const { return consumer_; }
    
private:
    mediasoupclient::Consumer* consumer_;
    ConsumerListenerWrapper* listener_;
};

#endif /* ConsumerWrapper_h */
