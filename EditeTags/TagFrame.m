                                                                                                                                                                                                                                                                                         //
//  TagFrame.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/30.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//




#import "TagFrame.h"

static const CGFloat HorizontalSpacing = 5;
static const CGFloat VerticalSpacing =5;
static const CGFloat RowHeight = 20;
static const CGFloat SectionInsetLeft = 5;
static const CGFloat SectionInseTop = 20;
static const CGFloat SectionInsetRight =5;
static const CGFloat ImageCellWidth = 20;
static const CGFloat TextFeildMinWidth = 50;

@implementation TagFrame

-(instancetype)initWithtagString:(NSString*)tagString lastTagFrame:(TagFrame*)lasTagFrame contentWidth:(float)contentWidth{
    self = [super init];
    if (self) {
        
        self.tagString = tagString;
        [self setDataWithLastTagFrame:(TagFrame*)lasTagFrame
                         contentWdith:(CGFloat)contentWidth tagString:(NSString*)tagString];
    }
    return self;
}

-(instancetype)initFirstImageTagFrame{
    self = [super init];
    if (self) {
        self.width = ImageCellWidth;
        self.point = CGPointMake(SectionInsetLeft, SectionInseTop);
        self.frame = CGRectMake(SectionInsetLeft, SectionInseTop, ImageCellWidth, RowHeight);
        
    }
    return self;
}

-(instancetype)initTextFeildTagFrameWithLastTagFrame:(TagFrame*)lastTagFrame contentWidth:(CGFloat)contentWidth{
    self = [super init];
    if (self) {
        
        
        [self setupTextFeildFrame:lastTagFrame contentWidth:contentWidth];
        
        
        
    }
    return self;
}

-(void)setDataWithLastTagFrame:(TagFrame*)lasTagFrame
                  contentWdith:(CGFloat)contentWidth tagString:(NSString*)tagString{
    CGFloat stringWidth = [TagLayoutHelper getAttributedWidthWithString:tagString]+1;
    if (lasTagFrame) {
        CGPoint lastPoint =  lasTagFrame.point;
        CGFloat lastWidth = lasTagFrame.width;
        CGFloat width = stringWidth+SectionInsetRight+SectionInsetLeft>contentWidth?(contentWidth-SectionInsetRight-SectionInsetLeft):stringWidth;
        if (lastPoint.x+lastWidth+width+HorizontalSpacing+SectionInsetRight>contentWidth) {
            self.point=CGPointMake(SectionInsetLeft, lastPoint.y+RowHeight+VerticalSpacing);
            
            self.frame = CGRectMake(SectionInsetLeft, lastPoint.y+RowHeight+VerticalSpacing, width, RowHeight);
        }
        else
        {
            self.point=CGPointMake(lastPoint.x+lastWidth+HorizontalSpacing, lastPoint.y);
            
            self.frame = CGRectMake(lastPoint.x+lastWidth+HorizontalSpacing, lastPoint.y, width, RowHeight);
        }
        self.width = width;
    }
    else
    {
        CGFloat width = stringWidth+SectionInsetRight+SectionInsetLeft+ImageCellWidth+HorizontalSpacing>contentWidth?(contentWidth-ImageCellWidth-SectionInsetRight-SectionInsetLeft-HorizontalSpacing):stringWidth;
        self.point=CGPointMake(SectionInsetLeft+ImageCellWidth+HorizontalSpacing, SectionInseTop);
        
        self.frame = CGRectMake(SectionInsetLeft+ImageCellWidth+HorizontalSpacing, SectionInseTop, width, RowHeight);
        
        self.width = width;
    }
}

-(void)setupTextFeildFrame:(TagFrame*)lastTagFrame contentWidth:(CGFloat)contentWidth{
    
    CGPoint lastPoint =  lastTagFrame.point;
    CGFloat lastWidth = lastTagFrame.width;
    
    CGFloat shengyuWidth = contentWidth-(lastPoint.x + lastWidth + SectionInsetRight + HorizontalSpacing);
    
    if (shengyuWidth<TextFeildMinWidth) {
        self.width = contentWidth - SectionInsetRight- SectionInsetLeft;
        self.point = CGPointMake(SectionInsetLeft, lastPoint.y+RowHeight+VerticalSpacing);
        self.frame = CGRectMake(SectionInsetLeft, lastPoint.y+RowHeight+VerticalSpacing, contentWidth - SectionInsetRight- SectionInsetLeft, RowHeight);
  
    }
    else
    {
        self.width = shengyuWidth;
        self.point = CGPointMake(lastPoint.x+lastWidth+HorizontalSpacing, lastPoint.y);
        self.frame = CGRectMake(lastPoint.x+lastWidth+HorizontalSpacing, lastPoint.y,shengyuWidth, RowHeight);
    }
    
}




@end
