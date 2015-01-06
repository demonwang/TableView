//
//  DMGateWayZigbeeList.m
//  TableView
//
//  Created by wangmeng on 15/1/6.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "DMGateWayZigbeeList.h"

@interface DMGateWayZigbeeList ()
@property (nonatomic) NSString * gateWayMac;
@end

@implementation DMGateWayZigbeeList{
    NSMutableArray * nodeList;
}
@synthesize gateWayMac;
-(instancetype)initWithNodeList:(NSMutableArray *)list{
    self = [super init];
    if(self){
        nodeList = list;
        UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(100, 80, 100, 40)];
        labe.text = [list objectAtIndex:0];
        [self.view addSubview:labe];
    }
    return self;
}

-(void)setGateWayMac:(NSString *)gateWayMac{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
