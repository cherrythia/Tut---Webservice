//
//  WebServiceManager.h
//  WebServiceDemo
//
//  Created by Quix Creations Singapore iOS 1 on 25/9/15.
//  Copyright © 2015 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestCompletionHandler)(NSString*,NSError*);
typedef void (^RequestDictionaryCompletionHandler)(NSDictionary*);

@interface WebServiceManager : NSObject
+(void)requestToPath:(NSString *)path onCompletion:(RequestCompletionHandler)complete;

+(void)loginWithUserName:(NSString *)userName
             andPassWord:(NSString *)password
            onCompletion:(RequestDictionaryCompletionHandler)complete;
@end
