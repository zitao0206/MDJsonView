//
//  MDJsonDemoViewController.m
//  MDProject
//
//  Created by lizitao on 2017/6/7.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonDemoViewController.h"
#import "MDJsonLabelModel.h"
#import "UIColor+nvutils.h"
#import "UIView+ResizeFrame.h"
#import "MDJsonLabel.h"
#import "MDJsonView.h"
#import "MDJsonViewModel.h"

@interface MDJsonDemoViewController ()
@property (nonatomic, strong) MDJsonLabel *jsonLabel;
@property (nonatomic, strong) MDJsonView *jsonView;

@end

@implementation MDJsonDemoViewController

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.jsonLabel = [MDJsonLabel new];
//    self.jsonLabel.numberOfLines = 0;
//    [self.view addSubview:self.jsonLabel];
//    NSString *jsonLabelstring = @"{\"x\":100,\"y\":90,\"width\":120,\"backgroundColor\":\"#aa631e\",\"lineSpacing\":10,\"textList\":[{\"text\":\"这是一个支持双引号的控件\",\"textSize\":16,\"textColor\":\"#ff631e\"},{\"text\":\"这是一个支持双引号的控件\",\"textSize\":12,\"textColor\":\"#22631e\"}]}";
//    self.jsonLabel.jsonString = jsonLabelstring;
//    [self.jsonLabel sizeToFit];
    NSString *jsonViewString = @"{\"type\":\"view\",\"x\":15,\"y\":90,\"width\":350,\"height\":300,\"backgroundColor\":\"#f0f0f0\",\"subViews\":[{\"type\":\"view\",\"x\":0,\"y\":0,\"width\":150,\"height\":100,\"backgroundColor\":\"#eaeaea\",\"subViews\":[{\"type\":\"view\",\"x\":0,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"subViews\":[]},{\"type\":\"view\",\"x\":55,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"subViews\":[]},{\"type\":\"label\",\"x\":0,\"y\":50,\"width\":50,\"backgroundColor\":\"#66631e\",\"lineSpacing\":5,\"textList\":[{\"text\":\"基于Json的动态化\",\"textSize\":10,\"textColor\":\"#ff631e\"},{\"text\":\"处理方案\",\"textSize\":12,\"textColor\":\"#22631e\"}]}]},{\"type\":\"view\",\"x\":155,\"y\":0,\"width\":150,\"height\":100,\"backgroundColor\":\"#eaeaea\",\"subViews\":[{\"type\":\"view\",\"x\":0,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"subViews\":[]},{\"type\":\"imageView\",\"x\":55,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"url\":\"https://p1.meituan.net/userheadpicbackend/64de7dfa6cfde3dcb3b66cae6397d23a118535.jpg%40120w_120h_1e_1c_1l%7Cwatermark%3D0\"}]}]}";
    _jsonView = [MDJsonView new];
    _jsonView.jsonString = jsonViewString;
    [self.view addSubview:_jsonView];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

@end
