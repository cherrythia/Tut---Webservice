//
//  HelloWorldViewController.m
//  WebServiceDemo
//
//  Created by Andrew Barba on 10/14/12.
//  Copyright (c) 2012 Andrew Barba. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "WebServiceManager.h"

@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *fetchButton;
@end

@implementation HelloWorldViewController

-(void)fetchAddress:(NSString *)address
{
    NSLog(@"Loading Address: %@",address);
    [WebServiceManager requestToPath:address onCompletion:^(NSString *result, NSError *error) {
        
        //code to happen on the main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                [self stopFetching:@"Failed to fetch"];
                NSLog(@"%@",error);
            }else{
                [self stopFetching:result];
            }
        });
    }];
}

- (IBAction)fetch:(id)sender
{
    [self startFetching];
    [self fetchAddress:self.addressField.text];
}

-(void)startFetching
{
    NSLog(@"Fetching...");
    [self.addressField resignFirstResponder];
    [self.loading startAnimating];
    self.fetchButton.enabled = NO;
}

-(void)stopFetching:(NSString *)result
{
    NSLog(@"Done Fetching!");
    self.outputLabel.text = result;
    [self.loading stopAnimating];
    self.fetchButton.enabled = YES;
}

@end
