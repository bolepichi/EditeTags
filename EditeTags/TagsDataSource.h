//
//  TagsDataSource.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/30.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagCell.h"
#import "TagFrame.h"

typedef  void (^ConfigureCellBlock)(TagCell *cell, NSIndexPath *indexPath, TagFrame* tagFrame);

typedef void(^ConfigureCollectionViewSize)(CGSize collectionViewSize);
@interface TagsDataSource : NSObject<UICollectionViewDataSource>

@property (copy, nonatomic) ConfigureCellBlock configureCellBlock;

@property (copy,nonatomic) ConfigureCollectionViewSize configureCollectionViewBlock;

-(TagFrame *)tagFrameAtIndexPath:(NSIndexPath *)indexPath;
-(NSArray *)indexPathsOfTagFrames;



@end
