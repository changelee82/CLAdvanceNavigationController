# CLAdvanceNavigationController 1.0
页面切换时，拥有前进效果的导航栏

<br />
作者：李辉 <br />
联系方式：6545823@qq.com <br />
编译环境：Xcode 7.2 <br />
运行环境：iOS 9.2 运行正常 <br />
您在使用该控件的过程中，如有任何疑问或建议，请通过邮箱联系我，谢谢！ <br />

<br />
![image](https://github.com/changelee82/CLAdvanceNavigationController/raw/master/Demo.gif)
<br />

使用方法
===============

    在 AppDelegate.h 中声明全局导航栏
    @class CLAdvanceNavigationController;
    /**  全局导航栏 */
    @property (strong, nonatomic) CLAdvanceNavigationController *navController;
    
    在 AppDelegate.m 中初始化全局导航栏
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
        // 创建屏幕窗口视图
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        
        // 创建并设置全局导航栏为window的根视图
        self.navController = [[CLAdvanceNavigationController alloc] init];
        self.window.rootViewController = self.navController;
        
        // 设置导航栏首页
        FirstViewController *firstVC = [[FirstViewController alloc] init];
        [self.navController pushViewController:firstVC animated:YES];
        
        return YES;
    }
    
    在做页面切换时，使用正常使用导航栏代码
    ThridViewController *thridVC = [[ThridViewController alloc] init];
    [self.navigationController pushViewController:thridVC animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.navigationController popToRootViewControllerAnimated:YES];



详细的示例请参考代码。 <br />

历史版本
===============
v1.0 - 2015-12-24 <br />
Added <br />
基础功能完成 <br />
