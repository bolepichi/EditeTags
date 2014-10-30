//
//  TagFrame.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/30.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//




#import "TagFrame.h"


static const CGFloat HorizontalSpacing = 7;
static const CGFloat VerticalSpacing =7;

static const CGFloat RowHeight = 20;
static const CGFloat SectionInsetLeft = 5;
static const CGFloat SectionInseTop = 0;
static const CGFloat SectionInsetRight =5;
//static const CGFloat SectionInsetBottom =0;
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

-(void)setDataWithLastTagFrame:(TagFrame*)lasTagFrame
                  contentWdith:(CGFloat)contentWidth tagString:(NSString*)tagString{
    
    
    CGFloat stringWidth = [self setAttributedWithString:tagString];
   

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
        CGFloat width = stringWidth+SectionInsetRight+SectionInsetLeft+ImageCellWidth>contentWidth?(contentWidth-ImageCellWidth-SectionInsetRight-SectionInsetLeft):stringWidth;
        self.point=CGPointMake(SectionInsetLeft+ImageCellWidth, SectionInseTop);
        
        self.frame = CGRectMake(SectionInsetLeft+ImageCellWidth, SectionInseTop, width, RowHeight);
        
        self.width = width;
    }
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


-(void)setupTextFeildFrame:(TagFrame*)lastTagFrame contentWidth:(CGFloat)contentWidth{
    
    CGPoint lastPoint =  lastTagFrame.point;
    CGFloat lastWidth = lastTagFrame.width;
    CGFloat shengyuWidth = contentWidth-lastPoint.x-lastWidth -SectionInsetRight;
    
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

-(CGFloat)setAttributedWithString:(NSString *)string
{
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"#%@",string]];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle  alloc] init];
    paragraphStyle.lineSpacing = 0;
    paragraphStyle.paragraphSpacing = 0;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.headIndent = 0;
    paragraphStyle.firstLineHeadIndent= 0;
    paragraphStyle.tailIndent = 0;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    paragraphStyle.lineHeightMultiple = 1.0f;
    paragraphStyle.paragraphSpacingBefore=0;
    NSDictionary *dicattributes = @{NSForegroundColorAttributeName:[UIColor grayColor],
                                    NSFontAttributeName:[UIFont systemFontOfSize:12.0f],
                                    NSParagraphStyleAttributeName:paragraphStyle
                                    };
    [attriString setAttributes:dicattributes range:NSMakeRange(0, string.length)];
    
    return [attriString size].width;
}



@end
