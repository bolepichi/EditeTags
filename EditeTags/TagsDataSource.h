//
//  TagsDataSource.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/30.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagStringCell.h"
#import "ImageCell.h"
#import "TextFeildCell.h"
#import "TagFrame.h"

typedef  void (^ConfigureTagStringCellBlock)(TagStringCell *cell, NSIndexPath *indexPath, TagFrame* tagFrame);
typedef void(^ConfigureTextFeildBlock)(TextFeildCell *textFeildCell, NSIndexPath *indexPath, TagFrame* tagFrame);


@interface TagsDataSource : NSObject<UICollectionViewDataSource>

@property (copy, nonatomic) ConfigureTagStringCellBlock configureTagStringCellBlock;

@property (copy, nonatomic) ConfigureTextFeildBlock configureTextFeildBlock;


-(TagFrame *)tagFrameAtIndexPath:(NSIndexPath *)indexPath;
-(NSArray *)indexPathsOfTagFrames;

-(void)setLayoutData:(NSArray*)array;

-(void)addTag:(NSString *)tagString addTagFrame:(void (^)(TagFrame *addtagFrame, NSInteger index))addtagFrameBolck;

-(void)setCollectViewSize:(void(^)(CGSize Size))collectionViewSizeBlock;

@end
