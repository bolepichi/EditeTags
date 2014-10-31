//
//  TagFrame.h
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/30.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagLayoutHelper.h"

@interface TagFrame : NSObject

@property (nonatomic,assign)CGPoint point;

@property (nonatomic,assign)CGFloat width;

@property (nonatomic,assign)CGRect frame;

@property (nonatomic,copy)NSString *tagString;
-(instancetype)initWithtagString:(NSString*)tagString lastTagFrame:(TagFrame*)lasTagFrame contentWidth:(float)contentWidth;
-(instancetype)initFirstImageTagFrame;
-(instancetype)initTextFeildTagFrameWithLastTagFrame:(TagFrame*)lastTagFrame contentWidth:(CGFloat)contentWidth;
@end
