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

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     TagsDataSource *dataSource = (TagsDataSource *)self.collectionView.dataSource;
     dataSource.configureCellBlock = ^(TagCell *cell, NSIndexPath *indexPath, TagFrame *tagFrame) {
        
    };

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
