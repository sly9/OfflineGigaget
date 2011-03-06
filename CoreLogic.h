//
//  CoreLogic.h
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-2-12.
//  Copyright 2011 Netease. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "MainWebFrameLoadDelegate.h"

@interface CoreLogic : NSObject {
    NSWindow *window;
    WebView *webView;
    MainWebFrameLoadDelegate *mainWebFrameLoadDelegate;
    NSPasteboard* clipboard;
    NSURL *lastHandledURL;
}
@property (nonatomic, retain) IBOutlet NSWindow *window;
@property (nonatomic, retain) WebView *webView;
@property (nonatomic, retain) MainWebFrameLoadDelegate *mainWebFrameLoadDelegate;
@property (nonatomic, retain) NSPasteboard* clipboard;
@property (nonatomic, retain) NSURL *lastHandledURL;
- (void)setup;

@end
