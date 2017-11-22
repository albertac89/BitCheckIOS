//
//  DataStore.m
//  BitCheckIOS
//
//  Created by Albert on 21/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (NSURL *)URLforTicker:(NSString *)currency_pair{
    if(!currency_pair) currency_pair = @"btcusd";
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://www.bitstamp.net/api/v2/ticker/%@",currency_pair]];
}

+ (NSURL *)URLforHourlyTicker:(NSString *)currency_pair{
    if(!currency_pair) currency_pair = @"btcusd";
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://www.bitstamp.net/api/v2/ticker_hour/%@",currency_pair]];
}

+ (NSURL *)URLforOrderBook:(NSString *)currency_pair{
    if(!currency_pair) currency_pair = @"btcusd";
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://www.bitstamp.net/api/v2/order_book/%@",currency_pair]];
}

+ (NSURL *)URLforTransactions:(NSString *)currency_pair{
    if(!currency_pair) currency_pair = @"btcusd";
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://www.bitstamp.net/api/v2/transactions/%@",currency_pair]];
}

@end
