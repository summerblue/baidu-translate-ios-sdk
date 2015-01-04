//
//  ViewController.m
//  BaiduTranslateExample
//
//  Created by CharlieJade on 1/4/15.
//  Copyright (c) 2015 TheEstGroup. All rights reserved.
//

#import "ViewController.h"

#import "BaiduTranslate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning 这里填写百度 API 的 KEY
    [BaiduTranslate setupBaiduClientKey:@"REPLACE ME WITH KEY"];

    BTResultBlock callback = ^(TranslationEntity *translation, NSError *error) {
        if (!error)
        {
            if (translation)
            {
                self.textView.text = translation.result;
                NSLog(@"Translation Result --> %@", translation);
            }
        }
        else
        {
            NSLog(@"------------ Translate, Error Occur -----------");
            NSLog(@"-- Error %@", error);
        }
    };

    [BaiduTranslate translate:@"今天天气不错." callback:callback];
}

@end
