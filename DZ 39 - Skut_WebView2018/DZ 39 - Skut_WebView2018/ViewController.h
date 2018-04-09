//
//  ViewController.h
//  DZ 39 - Skut_WebView2018
//
//  Created by mac on 09.04.2018.
//  Copyright © 2018 Dima Zgera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicater;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;

@property (strong, nonatomic) NSString *stringViewController;



- (IBAction)actionBack:(id)sender;

- (IBAction)actionForward:(id)sender;

- (IBAction)actionRefresh:(id)sender;


@end

