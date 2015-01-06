//
//  ViewController.m
//  TableView
//
//  Created by wangmeng on 15/1/6.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "ViewController.h"
#import "DMTabViewPagerController.h"

@interface ViewController ()<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController{
    NSMutableArray * list;
    DMTabViewPagerController * dmview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    list  = [[NSMutableArray alloc]initWithArray: @[
                               @[@"Wifi",@[@"01",@"02",@"03",@"04",@"05"]],
                               @[@"accfaccfacc1",@[@"01",@"02",@"03",@"04",@"05"]],
                               @[@"accfaccfacc2",@[@"01",@"02",@"03",@"04",@"05"]],
                               @[@"accfaccfacc3",@[@"01",@"02",@"03",@"04",@"05"]],
                               @[@"accfaccfacc4",@[@"01",@"02",@"03",@"04",@"05"]]
                               ]];
    
}
-(void)viewDidAppear:(BOOL)animated{
    dmview = [[DMTabViewPagerController alloc]initWithList:list frame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:dmview.view];
    [self.view bringSubviewToFront:_button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"设置"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"添加一个Button", @"删除一个button",@"添加一个page",@"删除一个page",@"删除一个 Button" ,@"重新加载",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            
            break;
            
        default:
            break;
    }
}
@end
