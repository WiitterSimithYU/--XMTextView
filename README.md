# XMTextView
XMTextView是UITextView的扩展的类，加入了placeholder和文字数量的功能，大大提高开发的时间，简化开发。

![Platform](https://wx3.sinaimg.cn/mw690/e067b31fgy1fstabpijwjj20af0mkjrt.jpg)

# 一，使用步骤
1，导入XMTextView文件夹

2，引用#import "XMTextView.h"头文件

3，使用方法：

    XMTextView *tv = [[XMTextView alloc] initWithFrame:CGRectMake(16, 10, self.view.frame.size.width-2*16, 200)];
    [scrollView addSubview:tv];
    tv.textViewListening = ^(NSString *textViewStr) {
        NSLog(@"监听输入的内容：%@",textViewStr);
    };
   
# 二，主要属性设置

    /** 文字最多字符数量显示类型 **/

    typedef enum {
        XMMaxNumStateNormal = 0,  // 默认模式（0/200）
        XMMaxNumStateDiminishing = 1,  // 递减模式（200）
    } XMMaxNumState;

    /** 是否设置边框 （默认 Yes） */

    @property (nonatomic, assign) BOOL isSetBorder;

    /** 上边距 (默认8)*/

    @property (nonatomic, assign) CGFloat topSpace;

    /** 左 右 边距 (默认8)*/

    @property (nonatomic, assign) CGFloat LRSpace;

    /** 边框线颜色 */

    @property (nonatomic, strong) UIColor *borderLineColor;

    /** 边宽线宽度 */

    @property (nonatomic, assign) CGFloat borderLineWidth;

    /** textView的内容 */

    @property (nonatomic, assign) NSString *contentStr;

    /** textView 文字颜色 (默认黑色) */

    @property (nonatomic, strong) UIColor *tvColor;

    /** textView 字体大小 (默认14) */

    @property (nonatomic, strong) UIFont *tvFont;

    /** 占位文字 (默认：请输入内容) */

    @property (nonatomic, copy) NSString *placeholder;

    /** placeholder 文字颜色 (默认[UIColor grayColor]) */

    @property (nonatomic, strong) UIColor *placeholderColor;

    /** 文字最多数量 (默认200个字符)*/

    @property (nonatomic, assign) int textMaxNum;

    /** Num 文字颜色 (默认黑色) */

    @property (nonatomic, strong) UIColor *maxNumColor;

    /** Num 字体大小 (默认12) */

    @property (nonatomic, strong) UIFont *maxNumFont;

    /** Num 样式 （默认 0/200） */

    @property (nonatomic, assign) XMMaxNumState maxNumState;

    /** 返回输入监听内容 */

    @property (nonatomic, copy) XMBackText textViewListening;

# 四，注意事项
frame设置一定要在设置其他属性之前

# 五，版本记录

- 2018-06-30　　初版


# 六，更多

1，如果觉得可以，请给个星星✨✨✨✨✨，谢谢🙏

1，如果您发现了bug请尽可能详细地描述系统版本、手机型号和复现步骤等信息 提一个issue.

2，我的简书http://www.jianshu.com/p/6e82fd2fcb01



