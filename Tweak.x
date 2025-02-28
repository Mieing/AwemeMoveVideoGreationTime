#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/*
@interface AWEPlayInteractionTimestampElement : NSObject
@property(nonatomic, strong, readwrite) UILabel *timestampLabel;
+ (NSDictionary *)cityCodeToNameMapping; // 保持类方法声明
@end

@interface AWEPlayInteractionTimestampElement : NSObject
@property(nonatomic, strong, readwrite) UILabel *timestampLabel;
@end

// 辅助函数保持不变
NSString *getCityNameFromCode(NSString *cityCode) {
    NSDictionary *cityCodeToNameMapping = [AWEAwemeModel cityCodeToNameMapping];
    return cityCodeToNameMapping[cityCode] ?: @"";
}
*/
@interface AWEPlayInteractionTimestampElement : NSObject
@property(nonatomic, strong, readwrite) UILabel *timestampLabel;
@end



//显示视频发布时间
%hook AWEPlayInteractionTimestampElement
+ (BOOL)shouldActiveWithData:(id)arg1 context:(id)arg2 {
    return YES;
}

//时间居中，方便开启播放进度时不重叠
- (void)layoutElementView {
    %orig;

// 靠左
    self.timestampLabel.textAlignment = NSTextAlignmentLeft;

 // 设置时间文本颜色
self.timestampLabel.textColor = [UIColor redColor]; // 将颜色改为红色

}


/*
// 居中
    self.timestampLabel.textAlignment = NSTextAlignmentCenter;

// 靠右
self.timestampLabel.textAlignment = NSTextAlignmentRight;
还有其它什么改字体、颜色等扩展玩法
*/

%end
