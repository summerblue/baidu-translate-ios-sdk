
## 说明

非官方 [百度翻译 API](http://developer.baidu.com/wiki/index.php?title=%E5%B8%AE%E5%8A%A9%E6%96%87%E6%A1%A3%E9%A6%96%E9%A1%B5/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91/%E7%BF%BB%E8%AF%91API) iOS SDK. 

## 截图

![](http://ww2.sinaimg.cn/large/6d86d850gw1enxu2lfpq9j20dc0oa0t3.jpg)

## 使用

使用 Cocoapod 安装: 

    pod 'BaiduTranslate', :git => "https://github.com/summerblue/baidu-translate-ios-sdk.git"
    
## 使用

```ojective-c

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

```

## License

Under the MIT license. See the LICENSE file for more info.

