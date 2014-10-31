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


@property (weak, nonatomic) IBOutlet TagsView *tagsView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tagsView   intalInterfaceWith:self.tagsView.bounds];

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
