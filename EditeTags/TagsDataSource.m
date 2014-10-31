//
//  TagsDataSource.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/30.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagsDataSource.h"






@interface  TagsDataSource()

@property (strong,nonatomic)NSMutableArray *layoutArray;

@property (assign,nonatomic)CGFloat contentWdith;

@end


@implementation TagsDataSource

- (void)awakeFromNib
{
    self.layoutArray = [NSMutableArray array];
}



-(id)init
{
    self = [super init];
    if (self) {
        
        self.layoutArray = [NSMutableArray array];
        
        [self setLayoutData:[NSArray array]];
        
    }
    return self;
}


//更新布局数组
-(void)setLayoutData:(NSArray*)array{
    if (self) {
        [self.layoutArray removeAllObjects];
    }
    else
    {
        self.layoutArray =[NSMutableArray array];
    }
    TagFrame *tagImageFrame = [[TagFrame alloc] initFirstImageTagFrame];
    [self.layoutArray addObject:tagImageFrame];
    for (int i=0; i<array.count; i++) {
        
        TagFrame *tagframe=[[TagFrame alloc]initWithtagString:[array objectAtIndex:i]
                                                 lastTagFrame:[self.layoutArray objectAtIndex:i]
                                                 contentWidth:320];
        [self.layoutArray addObject:tagframe];
    }
    
    TagFrame *tagTextFeildFrame = [[TagFrame alloc] initTextFeildTagFrameWithLastTagFrame:[self.layoutArray lastObject] contentWidth:320];
    
    [self.layoutArray addObject:tagTextFeildFrame];
    
    
    [self setCollectViewSize];
    
}

-(void)setCollectViewSize{
    TagFrame * textFeildTagFrame = [self.layoutArray lastObject];
    CGSize contentViewSize  = CGSizeMake(self.contentWdith, CGRectGetMaxY(textFeildTagFrame.frame));
    
    if (self.configureCollectionViewBlock) {
        self.configureCollectionViewBlock(contentViewSize);
    }
    
}



#pragma mark - TagsDataSource


-(TagFrame *)tagFrameAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.layoutArray[indexPath.item];
}


-(NSArray *)indexPathsOfTagFrames{
    NSMutableArray *indexPaths = [NSMutableArray array];
    [self.layoutArray enumerateObjectsUsingBlock:^(TagFrame* tagFrame, NSUInteger idx, BOOL *stop) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
            [indexPaths addObject:indexPath];
    }];
    return indexPaths;
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [self.layoutArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TagFrame *  tagFrame = self.layoutArray[indexPath.item];
    
    
    
    if (indexPath.item==0) {
        
        ImageCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
        
        
        return imageCell;
    }
    else if(indexPath.item == self.layoutArray.count-1){
        
        TextFeildCell *textFeildCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TextFeildCell" forIndexPath:indexPath];
        
        return textFeildCell;
        
    }
    else
    {
       TagStringCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagStringCell.h" forIndexPath:indexPath];
        
        if (self.configureTagStringCellBlock) {
            self.configureTagStringCellBlock(cell, indexPath, tagFrame);
        }
        return cell;

    }
}




@end
