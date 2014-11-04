//
//  ViewController.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/29.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagCell.h"

#import "ViewController.h"

#import "TagsDataSource.h"

#import "TagsView.h"

@interface ViewController ()


@property (nonatomic,strong) TagsView *tagsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tagsView = [[TagsView alloc] initWithFrame:CGRectMake(10, 70, 300, 200)];

   
    
    [self.view addSubview:self.tagsView];
    
     [self.tagsView   intalInterfaceWith:self.tagsView.bounds];

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
