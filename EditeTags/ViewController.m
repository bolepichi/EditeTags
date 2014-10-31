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
    
//     TagsDataSource *dataSource = (TagsDataSource *)self.collectionView.dataSource;
//     dataSource.configureCellBlock = ^(TagCell *cell, NSIndexPath *indexPath, TagFrame *tagFrame) {
//        
//         if(tagFrame.tagString){
//             cell.tagLabel.text = [NSString stringWithFormat:@"#%@",tagFrame.tagString];
//         }
//         
//         
//    };
//    dataSource.configureCollectionViewBlock = ^(CGSize contentSize){
//        self.collectionView.frame = CGRectMake(CGRectGetMidX(self.collectionView.frame),CGRectGetMidY(self.collectionView.frame), CGRectGetWidth(self.collectionView.frame), contentSize.height);
//    };

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
