//
//  DMTabViewPagerController.m
//  TableView
//
//  Created by wangmeng on 15/1/6.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import "DMTabViewPagerController.h"
#import "DMGateWayZigbeeList.h"
#define TAB_BAR_HIGHT 40
#define TAB_BAR_BTN_MIN_WIDTH  80
#define TAB_BAR_BTN_MAX_WIDTH  200

@interface DMTabViewPagerController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation DMTabViewPagerController{
    NSMutableArray * moduleList;
    UIScrollView * tabButtonsView;
    UITableView * tablePageView;
    NSMutableArray * tablePageList;
    NSMutableArray * tabBarBtnList;
    NSInteger tabbarwidth;
    NSInteger tabbuttonwidth;
    UIView * line;
    UIView * midLine;
}


#pragma Demon
-(instancetype)initWithList:(NSMutableArray *)list frame:(CGRect)frame{
    self = [super init];
    if(self){
        self.view.frame = frame;
        moduleList = list;
        self.view.backgroundColor = [UIColor greenColor];
        tabButtonsView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, TAB_BAR_HIGHT)];
        tabButtonsView.backgroundColor = [UIColor blackColor];
        
        
        
        tablePageView = [[UITableView alloc]init];//]WithFrame:CGRectMake(0, 20, frame.size.width, frame.size.height-20)];
        tablePageView.dataSource =self;
        tablePageView.delegate = self;
        tablePageView.scrollsToTop = YES;
        tablePageView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tablePageView.transform = CGAffineTransformMakeRotation(-M_PI/2);
        tablePageView.showsVerticalScrollIndicator = NO;
        tablePageView.pagingEnabled = YES;
        tablePageView.backgroundColor = [UIColor colorWithRed:192/256.0 green:192/256.0 blue:192/256.0 alpha:1.0];
        tablePageView.bounces =YES;
        tablePageView.frame = CGRectMake(0, TAB_BAR_HIGHT, frame.size.width, frame.size.height-TAB_BAR_HIGHT);
        tablePageList = [[NSMutableArray alloc]init];
        
        tabBarBtnList = [[NSMutableArray alloc]init];
        for (int i = 0; i < moduleList.count;  i++) {
            DMGateWayZigbeeList * gatecell = [[DMGateWayZigbeeList alloc]initWithNodeList:[moduleList objectAtIndex:i]];
            [tablePageList addObject:gatecell];
            NSMutableArray * dev = [moduleList objectAtIndex:i];
            NSString * title = [dev objectAtIndex:0];
            CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(MAXFLOAT, 25) lineBreakMode:NSLineBreakByWordWrapping];
            if(size.width < TAB_BAR_BTN_MIN_WIDTH){
                tabbuttonwidth = TAB_BAR_BTN_MIN_WIDTH;
            }else if(size.width > TAB_BAR_BTN_MAX_WIDTH){
                tabbuttonwidth = TAB_BAR_BTN_MAX_WIDTH;
            }else{
                tabbuttonwidth = size.width +30;
            }
            if(moduleList.count <= 2){
                tabbuttonwidth =frame.size.width/moduleList.count;
            }
            UIButton * tabButton = [[UIButton alloc]initWithFrame:CGRectMake(tabbarwidth,0 , tabbuttonwidth, TAB_BAR_HIGHT)];
            [tabButton setTitle:title forState:UIControlStateNormal];
            tabButton.titleLabel.font = [UIFont systemFontOfSize:15];
            tabButton.tag = i;
            [tabButtonsView addSubview:tabButton];
            tabbarwidth += tabbuttonwidth;
            [tabBarBtnList addObject:tabButton];
            [tabButton addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        tabButtonsView.contentSize = CGSizeMake(tabbarwidth, TAB_BAR_HIGHT);
        UIButton * fristBtn = [tabBarBtnList objectAtIndex:0];
        line = [[UIView alloc]initWithFrame:CGRectMake(fristBtn.frame.origin.x, 38, fristBtn.frame.size.width, 2)];
        line.backgroundColor = [UIColor blueColor];
        [tabButtonsView bringSubviewToFront:line];
        [tabButtonsView addSubview:line];
        CGRect linefrme = tabButtonsView.frame;
        linefrme.origin.y = 39;
        linefrme.size.width = tabbarwidth;
        linefrme.size.height = 1;
        midLine = [[UIView alloc]initWithFrame:linefrme];
        [midLine setBackgroundColor:[UIColor blueColor]];
        [tabButtonsView addSubview:midLine];
    }
    return self;
}
-(void)reloadView{

}
-(void)deleteButtonByName:(NSString *)name PageIndex:(NSInteger)pageIndex{
    
}
-(void)addButtonByName:(NSString *)name PageIndex:(NSInteger)pageIndex{

}
-(void)addPageAtIndex:(NSInteger )pageIndex{

}
-(void)deletePageAtIndex:(NSInteger )pageIndex{

}
-(void)reloadPageAtIndex:(NSInteger)pageIndex{

}

#pragma System
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view addSubview:tabButtonsView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self.view addSubview:tabButtonsView];
    [self.view addSubview:tablePageView];
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

#pragma Delegare UIscrollview

-(void)onBtnClick:(UIButton *)sender{
    [self selectIndex:sender.tag];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //    if (self.swipeDelegate != nil && [self.swipeDelegate respondsToSelector:@selector(contentSelectedIndexChanged:)])
    //    {
    //        int index = tableView.contentOffset.y / self.frame.size.width;
    //        [self.swipeDelegate contentSelectedIndexChanged:index];
    //    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    CGPoint pt =   tableView.contentOffset;
    //    [self.swipeDelegate scrollOffsetChanged:pt];
}

#pragma Delegate UItableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowCount = moduleList.count;
    
    return rowCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ViewCell";
    
    UITableViewCell *cell = nil;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ] ;
        cell.contentView.backgroundColor=[UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.transform = CGAffineTransformMakeRotation(M_PI/2);
        DMGateWayZigbeeList *vc = [tablePageList objectAtIndex:[indexPath row]];
        vc.view.frame = cell.bounds;
        [cell.contentView addSubview:  vc.view];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" willDisplayCell %d",indexPath.row);
    UIButton * fristBtn = [tabBarBtnList objectAtIndex:indexPath.row];
    [UIView animateWithDuration:0.2 animations:^(){
        CGRect frame = fristBtn.frame;
        if(frame.origin.x - tabButtonsView.contentOffset.x > self.view.frame.size.width){
            tabButtonsView.contentOffset = CGPointMake(frame.size.width, 0);
            if(tabButtonsView.contentOffset.x > tabbarwidth){
                tabButtonsView.contentOffset = CGPointMake(tabbarwidth - self.view.frame.size.width, 0);
            }
        }
        
        line.frame = CGRectMake(fristBtn.frame.origin.x, 38, fristBtn.frame.size.width, 2);
    }];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@" didDeselectRowAtIndexPath %d",indexPath.row);
}


-(void)selectIndex:(int)index
{
    [tablePageView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

#pragma tool


@end
