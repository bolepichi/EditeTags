//
//  TagCollectionViewLayout.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/29.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagCollectionViewLayout.h"

#import "TagsDataSource.h"


@implementation TagCollectionViewLayout

- (CGSize)collectionViewContentSize
{
    // Don't scroll horizontally
    CGFloat contentWidth = self.collectionView.bounds.size.width;
    
    // Scroll vertically to display a full day
    CGFloat contentHeight = self.collectionView.bounds.size.height;
    
    CGSize contentSize = CGSizeMake(contentWidth, contentHeight);
    return contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];

    // Cells
    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    return layoutAttributes;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagsDataSource *dataSource = self.collectionView.dataSource;
    TagFrame *tagFrame = [dataSource tagFrameAtIndexPath:indexPath];
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame =[self  frameForTagFrame:tagFrame];
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}



#pragma mark - Helpers
-(NSArray *)indexPathsOfItemsInRect:(CGRect)rect{
    
    TagsDataSource *dataSource = self.collectionView.dataSource;
    
    NSArray *indexPaths = [dataSource indexPathsOfTagFrames:rect];
    
    return indexPaths;
}


-(CGRect)frameForTagFrame:(TagFrame*)tagFrame{
    
    CGRect frame = CGRectMake(tagFrame.point.x, tagFrame.point.y, tagFrame.width, 20);
    return frame;
}



@end
