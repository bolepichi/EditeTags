//
//  TagsView.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SetViewHeightBlock)(CGFloat height);

typedef void(^GetTagsBlock)(NSArray *tags);

@interface TagsView : UIView

@property(nonatomic,strong)SetViewHeightBlock setViewHeightBlock;
@property(nonatomic,strong)GetTagsBlock getTagsBlock;

-(void)setTagsArray:(NSArray*)tags
       contentWidth:(CGFloat)contentWidth
      setViewHeight:(SetViewHeightBlock)setViewHeightBlock
       getTagsBlock:(GetTagsBlock)getTagsBlock;
//Edite
-(void)intalInterfaceWith:(CGRect)frame;
//inputdone
-(void)intalInputdoneview;

@end
