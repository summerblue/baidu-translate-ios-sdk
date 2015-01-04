//
//  TranslationEntity.h
//  OralMaster
//
//  Created by CharlieJade on 12/23/14.
//  Copyright (c) 2014 Jin. All rights reserved.
//

#import "Mantle.h"

@interface TranslationEntity : MTLModel <MTLJSONSerializing>

@property(strong,nonatomic) NSString* fromLanguage;
@property(strong,nonatomic) NSString* toLanguage;
@property(strong,nonatomic) NSString* translateText;
@property(strong,nonatomic) NSString* result;

+ (id)entityFromDictionary:(NSDictionary *)data;

@end
