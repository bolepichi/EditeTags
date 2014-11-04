//
//  TagsView.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagsView.h"
#import "TagFrame.h"
#import "TagsDataSource.h"
#import "TagCollectionViewLayout.h"



typedef enum : NSUInteger {
    TagsViewStateEditing=0,
    TagsViewStatesInputDone,
} TagsViewStates;



@interface TagsView ()<UICollectionViewDelegate>

@property (strong , nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic)TagsDataSource *dataSource;

@property (assign, nonatomic)TagsViewStates *state;

@property (strong, nonatomic)NSMutableArray *tagArray;

@end

@implementation TagsView


-(void)awakeFromNib
{
    //[self intalInterfaceWith:self.bounds];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       
        self.tagArray = [NSMutableArray array];
            
        
    }
    return self;
}



-(void)intalInterfaceWith:(CGRect)frame{
    
    TagCollectionViewLayout *layout = [[TagCollectionViewLayout alloc] init];
    
    UICollectionView *tagCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    tagCollectionView.backgroundColor =[UIColor whiteColor];
    [tagCollectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCell"];
    [tagCollectionView registerNib:[UINib nibWithNibName:@"TagStringCell" bundle:nil] forCellWithReuseIdentifier:@"TagStringCell"];
    [tagCollectionView registerNib:[UINib nibWithNibName:@"TextFeildCell" bundle:nil] forCellWithReuseIdentifier:@"TextFeildCell"];
    
    self.dataSource = [[TagsDataSource alloc]init];
    [tagCollectionView setDataSource:self.dataSource];
    [tagCollectionView setDelegate:self];
    [self addSubview:tagCollectionView];
    
     __weak typeof(self) tagView = self;
    self.dataSource.configureTagStringCellBlock = ^(TagStringCell *cell, NSIndexPath *indexPath, TagFrame* tagFrame){

        cell.textString = tagFrame.tagString;
    };
    self.dataSource.configureTextFeildBlock = ^ (TextFeildCell *textFeildCell, NSIndexPath *indexPath, TagFrame* tagFrame){
        
        textFeildCell.addTagBlock = ^(NSString *tagString){
          
            [tagView.dataSource addTag:tagString addTagFrame:^(TagFrame *addtagFrame, NSInteger index) {
               
                NSIndexPath *addIndexPath = [NSIndexPath indexPathForItem:index inSection:0];
                
                [tagCollectionView insertItemsAtIndexPaths:@[addIndexPath]];
                
            }];
        };
    
    };
    self.dataSource.configureCollectionViewBlock =^( CGSize  size ){
        [tagView setFrame:CGRectMake(CGRectGetMinX(tagView.frame), CGRectGetMinY(tagView.frame), CGRectGetWidth(tagView.frame), size.height)];
        [tagCollectionView  setFrame:CGRectMake(CGRectGetMinX(tagView.frame), CGRectGetMinY(tagView.frame), CGRectGetWidth(tagView.frame), size.height)];
        
    };
    
}


@end
