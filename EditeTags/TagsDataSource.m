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
    
    [self setLayoutData:@[@"北京",@"摄影",@"插画",@"艺术家",@"大话西游",@"降魔篇",@"超级无敌但华诞",@"爱在西元前",@"asdf",@"阿的说法水电费",@"阿萨德发时代",@"噶三等功",@"阿萨德发时代分",@"阿萨德发时代发生过",@"阿萨德发时代发时代发",@"阿萨德发时代发瓦斯的服务",@"2时代发",@"大风",@"asdf",@"阿萨德发时代",@"阿萨德发时代",@"阿萨德发时代",@"阿萨德发时代",@"阿萨德发时代发时代发时代",@"阿萨德发时代",@"阿萨德发时代发",@"阿萨德发时代发"]];
    
    
}

#pragma mark _ TagsDataSource Helper

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
    
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagCell" forIndexPath:indexPath];
    
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, indexPath, tagFrame);
    }
    return cell;
}




@end
