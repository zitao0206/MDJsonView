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
#import "MDJsonBaseView.h"
#import "MDJsonViewModel.h"

@interface MDJsonDemoViewController ()
@property (nonatomic, strong) MDJsonBaseView *jsonView;

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
    NSString *jsonViewString = @"{\"type\":\"view\",\"x\":15,\"y\":90,\"width\":350,\"height\":300,\"backgroundColor\":\"#f0f0f0\",\"subViews\":[{\"type\":\"view\",\"x\":0,\"y\":0,\"width\":150,\"height\":100,\"backgroundColor\":\"#eaeaea\",\"subViews\":[{\"type\":\"view\",\"x\":0,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"subViews\":[]},{\"type\":\"view\",\"x\":55,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"subViews\":[]},{\"type\":\"label\",\"x\":0,\"y\":50,\"width\":50,\"backgroundColor\":\"#66631e\",\"lineSpacing\":5,\"textList\":[{\"text\":\"基于Json的动态化\",\"textSize\":10,\"textColor\":\"#ff631e\"},{\"text\":\"处理方案\",\"textSize\":12,\"textColor\":\"#22631e\"}]}]},{\"type\":\"view\",\"x\":155,\"y\":0,\"width\":150,\"height\":100,\"backgroundColor\":\"#eaeaea\",\"subViews\":[{\"type\":\"view\",\"x\":0,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"subViews\":[]},{\"type\":\"imageView\",\"isNeedCallBack\":1,\"x\":55,\"y\":0,\"width\":50,\"height\":50,\"backgroundColor\":\"#aaaaaa\",\"url\":\"http://www.dpfile.com/gp/cms/1451374556708.png\"}]}]}";
    _jsonView = [MDJsonBaseView new];
    _jsonView.jsonString = jsonViewString;
   
    [_jsonView obtainResult:^(MDJsonNotificationResultModel *result) {
        NSLog(@"%@",result);
    }];
    
    [self.view addSubview:_jsonView];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

@end
