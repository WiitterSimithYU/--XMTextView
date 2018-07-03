//
//  ViewController.m
//  XMTextView
//
//  Created by XM on 2018/6/29.
//  Copyright © 2018年 XM. All rights reserved.
//

#import "ViewController.h"
#import "XMTextView.h"
#import "UITextView+XMExtension.h"

/** 是否是iphoneX设备 */
#define IS_PhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define NavFrame (IS_PhoneX?CGRectMake(0, 0, WIDTH, 88):CGRectMake(0, 0, WIDTH, 64))
#define SCROLLVIEW_CONTENTSIZE (HEIGHT - NavFrame.size.height + 1)

// 宽高
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = @"XMTextView";
    
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(WIDTH, SCROLLVIEW_CONTENTSIZE);
    scrollView.contentInset = UIEdgeInsetsMake(NavFrame.size.height, 0, 0, 0);
    [self.view addSubview:scrollView];
    
    XMTextView *tv = [[XMTextView alloc] initWithFrame:CGRectMake(16, 10, self.view.frame.size.width-2*16, 200)];
    [scrollView addSubview:tv];
    tv.textViewListening = ^(NSString *textViewStr) {
        NSLog(@"tv监听输入的内容：%@",textViewStr);
    };
    
    XMTextView *tv2 = [[XMTextView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(tv.frame)+20, self.view.frame.size.width-2*16, 200)];
    tv2.placeholder = @"自定义placeholder";
    tv2.placeholderColor = [UIColor blueColor];
    tv2.borderLineColor = [UIColor redColor];
    tv2.tvColor = [UIColor greenColor];
    tv2.tvFont = [UIFont systemFontOfSize:18];
    tv2.textMaxNum = 1000;
    tv2.maxNumState = XMMaxNumStateDiminishing;
    [scrollView addSubview:tv2];
    tv2.textViewListening = ^(NSString *textViewStr) {
        NSLog(@"tv2监听输入的内容：%@",textViewStr);
    };
}

#pragma  mark - 滚动scrollView 键盘退下
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    // 取消键盘
    [self.view endEditing:YES];
}


@end
