//
//  DataStore.h
//  BitCheckIOS
//
//  Created by Albert on 21/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

+ (NSURL *)URLforTicker:(NSString *)currency_pair;
+ (NSURL *)URLforHourlyTicker:(NSString *)currency_pair;
+ (NSURL *)URLforOrderBook:(NSString *)currency_pair;
+ (NSURL *)URLforTransactions:(NSString *)currency_pair;

@end
