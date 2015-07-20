//
//  CustomTabBar.h
//  01-手工客3.5
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;


//设置tabbar 的代理，用来告诉最外层的tabbarcontroller，切换视图
@protocol CustomTabBarDelegate <NSObject>

@optional
-(void)tabBar:(CustomTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end


@interface CustomTabBar : UIView

//设置代理：
@property (nonatomic ,weak)id<CustomTabBarDelegate> delegate;

//通过item添加tabbar的按钮：
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;


@end
