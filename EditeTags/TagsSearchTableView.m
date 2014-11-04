//
//  TagsSearchTableView.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/11/4.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagsSearchTableView.h"
#import "SearchTagCell.h"

@interface TagsSearchTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)NSMutableArray *reslutTags;

@end

@implementation TagsSearchTableView


-(void)noSuggestions{
    [self.reslutTags removeAllObjects];
    [self reloadData];
    
    UIView *nosuggestionsHeadView = [[UIView alloc]initWithFrame:self.frame];
    
    CGFloat tableViewWidth = CGRectGetWidth(self.frame);
    CGFloat tableViewHeight = CGRectGetHeight(self.frame);
    
    CGFloat labelheight = 30.0f;
    
    UILabel *noSuggestionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, tableViewHeight*0.5-labelheight*0.5, tableViewWidth, labelheight)];
    noSuggestionLabel.text = @"No seggestions";
    noSuggestionLabel.textAlignment = NSTextAlignmentCenter;
    noSuggestionLabel.textColor = [UIColor grayColor];
    [nosuggestionsHeadView addSubview:noSuggestionLabel];
    
    [self setTableHeaderView:nosuggestionsHeadView];
}

-(void)shoWprogressHud{
    UIView *rquestWiatView =[[UIView alloc] initWithFrame:self.frame];
    CGFloat tableViewWidth = CGRectGetWidth(self.frame);
    CGFloat tableViewHeight = CGRectGetHeight(self.frame);
    
    CGFloat labelheight = 30.0f;
    
    UILabel *progressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, tableViewHeight*0.5-labelheight*0.5, tableViewWidth, labelheight)];
    progressLabel.text = @"请求标签";
    progressLabel.textAlignment = NSTextAlignmentCenter;
    progressLabel.textColor = [UIColor grayColor];
    [rquestWiatView addSubview:progressLabel];
    [self setTableHeaderView:rquestWiatView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.reslutTags.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SearchTagCell *searchCell = [tableView dequeueReusableCellWithIdentifier:@"SearchTagCell" forIndexPath:indexPath];
    
    searchCell.tagString.text = self.reslutTags[indexPath.row];
    
    return searchCell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0f;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectTagBlock) {
        self.selectTagBlock(self.reslutTags[indexPath.row]);
    }
}





@end
