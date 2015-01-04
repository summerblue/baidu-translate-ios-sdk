//
//  TranslateApi.h
//  OralMaster
//
//  Created by CharlieJade on 12/23/14.
//  Copyright (c) 2014 Jin. All rights reserved.
//

#import "TranslationEntity.h"
#import "AFHTTPSessionManager.h"

#define BaiduApiTranslate          @"http://openapi.baidu.com/public/2.0/bmt/translate"

typedef void (^ BTResultBlock)(TranslationEntity *entity, NSError *error);

typedef void (^ BTRequestSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^ BTRequestFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface BaiduTranslate : AFHTTPSessionManager

+ (void)setupBaiduClientKey:(NSString *)value;
+ (id)translate:(NSString *)text callback:(BTResultBlock)block;

@end
