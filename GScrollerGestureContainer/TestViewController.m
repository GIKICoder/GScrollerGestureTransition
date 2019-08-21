//
//  TestViewController.m
//  GScrollerGestureContainer
//
//  Created by GIKI on 2019/8/20.
//  Copyright © 2019 GIKI. All rights reserved.
//

#import "TestViewController.h"
#import "GScrollerGestureTransition.h"
@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) GScrollerGestureTransition * scrollerTransition;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        _tableView = tableView;
        tableView;
    })];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.tableView.frame = self.view.bounds;
    self.scrollerTransition = [GScrollerGestureTransition transitionWithTargetView:self.view scroller:self.tableView];
    self.scrollerTransition.delegate = self;
}

- (void)transitionChangedStateFinish:(ScrollerTransitionState)state offsetY:(CGFloat)offsetY animated:(BOOL)animated
{
    if (state == ScrollerTransitionStateBottom) {
//        [self dismissViewControllerAnimated:animated completion:^{
//            
//        }];
    }
}

#pragma mark -- TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
    }
    cell.backgroundColor = UIColor.redColor;
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld个cell",indexPath.row];
    return cell;
}

#pragma mark -- TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.scrollerTransition __scrollViewDidScroll:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.scrollerTransition __scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.scrollerTransition __scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

@end
