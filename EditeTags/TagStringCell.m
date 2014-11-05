//
//  TagStringCell.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TagStringCell.h"

#import "TagLayoutHelper.h"

@interface TagStringCell ()

@property (weak, nonatomic) IBOutlet UILabel *tagString;

@end

@implementation TagStringCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setTextString:(NSString *)textString
{
    self.tagString.attributedText = [TagLayoutHelper getAttributedWithSting:textString];
    
}


//-(void)setHighlighted:(BOOL)highlighted{
//    
//    [super setHighlighted:highlighted];
//    
//    if (highlighted) {
//        
//        [self.tagString.layer setCornerRadius:2.5];
//        [self.tagString.layer setMasksToBounds:YES];
//        self.tagString.backgroundColor = [UIColor colorWithRed:111.0/255 green:200.0/255 blue:255.0/255.0 alpha:1.0];
//        
//        
//        
//    }else{
//        [self.tagString.layer setCornerRadius:0.0];
//        [self.tagString.layer setMasksToBounds:NO];
//        self.tagString.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
//    }
//    
//}

-(void)setSelected:(BOOL)selected
{
    if (selected) {
        [self.tagString.layer setCornerRadius:2.5];
        [self.tagString.layer setMasksToBounds:YES];
        self.tagString.backgroundColor = [UIColor colorWithRed:111.0/255 green:200.0/255 blue:255.0/255.0 alpha:1.0];
    }else{
        [self.tagString.layer setCornerRadius:0.0];
        [self.tagString.layer setMasksToBounds:NO];
        self.tagString.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    }
}


@end
