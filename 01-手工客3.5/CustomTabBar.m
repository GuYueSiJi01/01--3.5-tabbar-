//
//  CustomTabBar.m
//  01-手工客3.5
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBarButton.h"

@interface CustomTabBar ()

//记录当前选中的按钮：
@property (nonatomic ,weak)CustomTabBarButton * selectedButton;

@end

@implementation CustomTabBar


//初始化设置背景图片：
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
//        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbarBackground"]];
    }
    return self;
}



//通过item添加按钮：
-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    CustomTabBarButton * button=[[CustomTabBarButton alloc]init];
    [self addSubview:button];
    
    [button setWithItem:item];
    
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //默认选中第0个按钮：
    if (self.subviews.count==1) {
        [self btnClick:button];
    }
    
    
}


-(void)btnClick:(CustomTabBarButton *)button
{
    //当代理中实现了这个方法的时候，操作：
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    //设置按钮的状态：
    //将之前选中的button的selected属性变为no，将当选中的button的selected属性设为yes
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
    
    
}


//布局子视图：
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW=self.frame.size.width/self.subviews.count;
    CGFloat buttonH=self.frame.size.height;
    CGFloat buttonY=0;
    
    for (int index=0; index<self.subviews.count; index++) {
        CustomTabBarButton * button=(CustomTabBarButton *)self.subviews[index];
        
        CGFloat buttonX=index*buttonW;
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //绑定tag
        button.tag=index;
        
    }
    
}



@end
