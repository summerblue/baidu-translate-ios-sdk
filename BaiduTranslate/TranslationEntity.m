//
//  TranslationEntity.m
//  OralMaster
//
//  Created by CharlieJade on 12/23/14.
//  Copyright (c) 2014 Jin. All rights reserved.
//

#import "TranslationEntity.h"

@implementation TranslationEntity

@synthesize fromLanguage;
@synthesize toLanguage;
@synthesize translateText;
@synthesize result;

#pragma mark - Mantle

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"fromLanguage" : @"from",
             @"toLanguage" : @"to",
             @"translateText" : @"trans_result.src",
             @"result" : @"trans_result.dst"
             };
}

+ (NSValueTransformer *)translateTextJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSArray *arr) {
        return arr[0];
    }];
}

+ (NSValueTransformer *)resultJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSArray *arr) {
        return arr[0];
    }];
}

#pragma mark - Helpers

+ (id)entityFromDictionary:(NSDictionary *)data
{
    NSError *error;
    id entity = [MTLJSONAdapter modelOfClass:self.class fromJSONDictionary:data error:&error];
    
    if (error) {
        NSLog(@"Couldn't convert JSON to Entity: %@", error);
        return nil;
    }
    return entity;
}

@end
