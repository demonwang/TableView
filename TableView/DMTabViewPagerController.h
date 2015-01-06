//
//  DMTabViewPagerController.h
//  TableView
//
//  Created by wangmeng on 15/1/6.
//  Copyright (c) 2015年 HF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DMTabViewPagerDelegate <NSObject>


@end


@interface DMTabViewPagerController : UIViewController

@property id<DMTabViewPagerDelegate> delegate;

-(instancetype)initWithList:(NSMutableArray *)list frame:(CGRect)frame;
-(void)reloadView;
-(void)deleteButtonByName:(NSString *)name PageIndex:(NSInteger)pageIndex;
-(void)addButtonByName:(NSString *)name PageIndex:(NSInteger)pageIndex;
-(void)addPageAtIndex:(NSInteger )pageIndex;
-(void)deletePageAtIndex:(NSInteger )pageIndex;
-(void)reloadPageAtIndex:(NSInteger)pageIndex;
@end
