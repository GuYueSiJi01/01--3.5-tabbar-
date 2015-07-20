//
//  CustomTabBarButton.m
//  01-手工客3.5
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "CustomTabBarButton.h"

//image的占用比例：
#define imageHeightRatio 0.6

@implementation CustomTabBarButton


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        //设置button的一些固有属性：(图片／文字居中/字体／字体颜色（选中和非选中）)
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
    }
    return self;
}

//设置高亮：
-(void)setHighlighted:(BOOL)highlighted
{
    
}

//设置image的rect
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*imageHeightRatio;
    return CGRectMake(0, 0, imageW, imageH);
}


//设置title的rect：
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW=contentRect.size.width;
    CGFloat titleY=contentRect.size.height*imageHeightRatio;
    CGFloat titleH=contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

//通过item设置button的属性：
-(id)setWithItem:(UITabBarItem *)item
{
    //设置button的一些属性：
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    //设置选中时候的背景图
//    [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
    return self;
}


@end
