//
//  WebServiceManager.m
//  WebServiceDemo
//
//  Created by Quix Creations Singapore iOS 1 on 25/9/15.
//  Copyright © 2015 Andrew Barba. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager
+(void)requestToPath:(NSString *)path onCompletion:(RequestCompletionHandler)complete{
    
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc]init];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:path]
                                                 cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                             timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse * response, NSData * data, NSError * error) {
                               NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                               if (complete) {
                                   complete(result,error);
                               }
                            }];
}
@end
