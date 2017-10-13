#import <UIKit/UIKit.h>

@interface ChineseToPinyin : NSObject {
    
}

+ (NSString *) pinyinFromChiniseString:(NSString *)string;
+ (char) sortSectionTitle:(NSString *)string; 
+ (NSString *)NSUTF_8ToGBKWithString:(NSString *)string;
+ (NSString *)GBKToNSUTF_8WithString:(NSString *)string;
@end
