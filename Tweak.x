#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface AWEPlayInteractionTimestampElement : NSObject
@property(nonatomic, strong, readwrite) UILabel *timestampLabel;
@end

// 显示视频发布时间
%hook AWEPlayInteractionTimestampElement
+ (BOOL)shouldActiveWithData:(id)arg1 context:(id)arg2 {
    return YES;
}

// 时间居中并设置颜色
- (void)layoutElementView {
    %orig;
    
    // 文本对齐方式
    self.timestampLabel.textAlignment = NSTextAlignmentLeft;
    // 文本颜色设置
    self.timestampLabel.textColor = [UIColor redColor];
    
    /* 其他扩展玩法：
     - 字体修改：self.timestampLabel.font = [UIFont systemFontOfSize:12];
     - 对齐方式：NSTextAlignmentLeft/NSTextAlignmentRight
     - 背景色：self.timestampLabel.backgroundColor = [UIColor clearColor];
     */
}
%end