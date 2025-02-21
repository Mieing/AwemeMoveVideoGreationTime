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
//居中
    self.timestampLabel.textAlignment = NSTextAlignmentCenter;
/*
也可设置靠右
self.timestampLabel.textAlignment = NSTextAlignmentRight;
还有其它什么改字体、颜色等扩展玩法
*/
}
%end
