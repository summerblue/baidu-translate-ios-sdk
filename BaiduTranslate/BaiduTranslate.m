//
//  TranslateApi.m
//  OralMaster
//
//  Created by CharlieJade on 12/23/14.
//  Copyright (c) 2014 Jin. All rights reserved.
//

#import "BaiduTranslate.h"

@implementation BaiduTranslate

static NSString* baiduClientKey = nil;

+ (instancetype)shareInstance
{
    static BaiduTranslate *_baiduTranslateShareInstance = nil;
    static dispatch_once_t baiduTranslateOnceToken;
    dispatch_once(&baiduTranslateOnceToken, ^{
        _baiduTranslateShareInstance = [BaiduTranslate manager];
    });
    return _baiduTranslateShareInstance;
}

+ (void)setupBaiduClientKey:(NSString *)value
{
    baiduClientKey = value;
}

+ (id)translate:(NSString *)text callback:(BTResultBlock)block
{
    NSParameterAssert(baiduClientKey != nil);
    
    BTRequestSuccessBlock successBlock = ^(NSURLSessionDataTask * __unused task, id rawData)
    {
        NSMutableDictionary *data = [(NSDictionary *)rawData mutableCopy];
        TranslationEntity *entity = [TranslationEntity entityFromDictionary:data];
        if (block) block(entity, nil);
    };
    
    BTRequestFailureBlock failureBlock = ^(NSURLSessionDataTask *__unused task, NSError *error)
    {
        if (block) block(nil, error);
    };
    
    NSDictionary *param = @{
                            @"client_id": baiduClientKey,
                            @"from": @"auto",
                            @"to": @"auto",
                            @"q": text
                            };
    
    return [[BaiduTranslate shareInstance] GET:BaiduApiTranslate
                                    parameters:param
                                       success:successBlock
                                       failure:failureBlock];
}

@end
