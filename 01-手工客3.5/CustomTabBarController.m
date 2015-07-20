//
//  CustomTabBarController.m
//  01-手工客3.5
//
//  Created by qianfeng on 15-7-15.
//  Copyright (c) 2015年 lix. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBar.h"

@interface CustomTabBarController ()<CustomTabBarDelegate>

//自定义的tabbar：
@property (nonatomic ,weak)CustomTabBar * customTabBar;

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加自定义的tabbar：
    [self setCustomTabBar];
    
    //所有子控制器的布局：
    [self setAllChildViewControllers];
   
    
    
    
}


//当view将要加载的时候，将原先系统添加的tabbarbutton删除：
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //    NSLog(@"%@",self.tabBar.subviews);
    
    for (UIView * childView in self.tabBar.subviews) {
        
        //注：这个时候的childView并不是tabbarbutton类型，因为tabbarbutton是私有的，外部不能调用，childView是继承自UIControl
        if ([childView isKindOfClass:[UIControl class]]) {
            [childView removeFromSuperview];
        }
    }
    
}


//设置自定义的tabbar：
-(void)setCustomTabBar
{
    CustomTabBar * tabbar=[[CustomTabBar alloc]init];
    tabbar.frame=self.tabBar.bounds;
//    tabbar.backgroundColor=[UIColor redColor];
    
    //将控制器设置成为tabbar 的代理：
    tabbar.delegate=self;
    
    [self.tabBar addSubview:tabbar];
    self.customTabBar=tabbar;
}


//监听tabbar按钮的改变：
-(void)tabBar:(CustomTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
//    NSLog(@"from :%d ----- to: %d",from,to);
    
    //设置当前选中的视图控制器是那一个：
    self.selectedIndex=to;
    
    
}





//布局所有的子控制器：
-(void)setAllChildViewControllers
{
    //发现：
    UIViewController * discover=[[UIViewController alloc]init];
    [self setChildViewController:discover title:@"发现" imageName:@"tb_findD" selectedImageName:@"tb_findS"];
    
    //教程：
    UIViewController * teachCourses=[[UIViewController alloc]init];
    [self setChildViewController:teachCourses title:@"教程" imageName:@"tb_teachD" selectedImageName:@"tb_teachS"];
    
    //手工圈：
    UIViewController * handGroup=[[UIViewController alloc]init];
    [self setChildViewController:handGroup title:@"手工圈" imageName:@"tb_handD" selectedImageName:@"tb_handS"];
    
    //个人总心（我的）：
    UIViewController * person=[[UIViewController alloc]init];
    [self setChildViewController:person title:@"我的" imageName:@"tb_perD" selectedImageName:@"tb_perS"];
    
    
}

-(void)setChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVC.view.backgroundColor=[UIColor greenColor];
    childVC.title=title;
    childVC.tabBarItem.image=[UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //包装一个导航控制器
    UINavigationController * nvc=[[UINavigationController alloc]initWithRootViewController:childVC];
    
//    nvc.navigationBar.backgroundColor=[UIColor colorWithRed:231/255 green:61/255 blue:61/255 alpha:0.8];
    nvc.navigationBar.tintColor=[UIColor redColor];
    
    
    [self addChildViewController:nvc];
    
    //添加tabbar内部按钮：
    [self.customTabBar addTabBarButtonWithItem:childVC.tabBarItem];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
