//
//  ViewController.m
//  DZ 39 - Skut_WebView2018
//
//  Created by mac on 09.04.2018.
//  Copyright © 2018 Dima Zgera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *request;
    
    if([[self.stringViewController lowercaseString] hasPrefix:[@"http://" lowercaseString]]) {
        
        NSString *urlString = self.stringViewController;
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        request = [NSURLRequest requestWithURL:url];
        
    } else {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:self.stringViewController ofType:nil];
        
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        
        request = [NSURLRequest requestWithURL:fileUrl];
    }
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions


- (IBAction)actionBack:(id)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction)actionForward:(id)sender {
    
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)actionRefresh:(id)sender {
    
    [self.webView stopLoading];
    [self.webView reload];
}

- (void)refreshButtons {
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
}

#pragma mark - UIWebViewDelegate


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    //[self.indicater startAnimating];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [self refreshButtons];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    //[self.indicater stopAnimating];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    NSLog(@"didFailLoadWithError %@", error);
    
    [self.indicater stopAnimating];
    
    [self refreshButtons];
}



@end
