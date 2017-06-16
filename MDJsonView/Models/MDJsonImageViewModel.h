//
//  MDJsonImageViewModel.h
//  MDProject
//
//  Created by lizitao on 2017/6/15.
//  Copyright © 2017年 lizitao. All rights reserved.
//

#import "MDJsonModel.h"

@interface MDJsonImageViewModel : MDJsonModel
/**url*/
@property(nonatomic, copy) NSString *url;
/**本地图片*/
@property(nonatomic, copy) NSString *localImageName;

@end
