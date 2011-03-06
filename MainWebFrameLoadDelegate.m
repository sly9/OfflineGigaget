//
//  MainWebFrameLoadDelegate.m
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-2-12.
//  Copyright 2011 Netease. All rights reserved.
//

#import "MainWebFrameLoadDelegate.h"


@implementation MainWebFrameLoadDelegate

- (void) handleLogin:(WebView *)webView{
    DOMDocument *document = [webView mainFrameDocument];
    DOMElement *userNameInput = [document querySelector:@"#u"];
    [userNameInput setAttribute:@"value" value:@"sly.thu@gmail.com"];
    DOMElement *passwordInput = [document querySelector:@"#p_show"];
    [passwordInput setAttribute:@"value" value:@"adgjladgjl"];
    DOMElement *rememberPasswordInput = [document querySelector:@"#login_enable"];
    [rememberPasswordInput setAttribute:@"checked" value:@"checked"];
    
    [[webView windowScriptObject] evaluateWebScript:@"submitForm()"];
    
}
- (void) handleURLDownload:(WebView *)webView forURL:(NSString *)url{
    [[webView windowScriptObject] evaluateWebScript:@"add_task_new(0);"];
    [[webView windowScriptObject] evaluateWebScript:[NSString stringWithFormat: @"document.querySelector('#task_url').value='%@'",url]];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame{
    NSLog(@"a webview finished loading for url: %@!, with content: %@",[sender mainFrameURL],[sender mainFrameDocument]);
    NSString *currentURL = [sender mainFrameURL];
    if ([currentURL compare:@"http://lixian.vip.xunlei.com/task.html"] == NSOrderedSame) {
        [self handleLogin:sender];
    }
    if ([currentURL hasPrefix:@"http://dynamic.lixian.vip.xunlei.com/user_task"]){
        //[self handleURLDownload:sender];
    }
}



@end
