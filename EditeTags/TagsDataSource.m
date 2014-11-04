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



-(void)addTag:(NSString *)tagString addTagFrame:(void (^)(TagFrame *addtagFrame, NSInteger index))addtagFrameBolck{
    
    TagFrame *lastTagFrame = [self.layoutArray objectAtIndex:self.layoutArray.count-2];
    
    TagFrame *addTagFrame =  [[TagFrame alloc] initWithtagString:tagString lastTagFrame:self.layoutArray.count==2?nil:lastTagFrame contentWidth:300];
    
    [self.layoutArray insertObject:addTagFrame atIndex:self.layoutArray.count-1];
    
    [self.layoutArray removeLastObject];

    TagFrame *textfeildTagFrame = [[TagFrame alloc] initTextFeildTagFrameWithLastTagFrame:addTagFrame contentWidth:300];
    
    [self.layoutArray addObject:textfeildTagFrame];
    
    addtagFrameBolck(addTagFrame,self.layoutArray.count-2);

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
                                                 contentWidth:300];
        [self.layoutArray addObject:tagframe];
    }
    
    TagFrame *tagTextFeildFrame = [[TagFrame alloc] initTextFeildTagFrameWithLastTagFrame:[self.layoutArray lastObject] contentWidth:300];
    
    [self.layoutArray addObject:tagTextFeildFrame];
    
    
    NSLog(@"%d",self.layoutArray.count);
    
}



-(void)setCollectViewSize:(void(^)(CGSize Size))collectionViewSizeBlock{
    
    TagFrame * textFeildTagFrame = [self.layoutArray lastObject];
    CGSize contentViewSize  = CGSizeMake(300, CGRectGetMaxY(textFeildTagFrame.frame)+20);
    collectionViewSizeBlock(contentViewSize);
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
        
        if (self.configureTextFeildBlock) {
            self.configureTextFeildBlock(textFeildCell,indexPath,tagFrame);
        }
        return textFeildCell;
        
    }
    else
    {
       TagStringCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagStringCell" forIndexPath:indexPath];
        
        if (self.configureTagStringCellBlock) {
            self.configureTagStringCellBlock(cell, indexPath, tagFrame);
        }
        
        return cell;

    }
}




@end
