//
//  TextFeiledCell.m
//  EditeTags
//
//  Created by Taagoo'iMac on 14/10/31.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "TextFeildCell.h"

@interface TextFeildCell ()

@property (nonatomic, assign)BOOL isInput;





@end

@implementation TextFeildCell

- (void)awakeFromNib {
    
    self.textFeild.delegate = self;
    
    self.isInput = YES;
}
- (IBAction)EndEditing:(id)sender {
    
    
    
}

- (IBAction)textFeildTextChanged:(UITextField *)sender {
    // 开始搜索
    if (sender.text.length>1) {
        NSString *tagString = [sender.text substringFromIndex:1];
        if (_editingBlock) {
            _editingBlock(tagString);
        }
    }
    
    // 停止搜索
    if ([sender.text isEqualToString:@" "] && self.isInput==YES) {
        
        if (_stopSearchBlock) {
              _stopSearchBlock();
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (self.isInput==YES) {
        
        if (range.location ==0 && range.length==1) {
            textField.text = @" ";
            self.isInput = NO;
            
            if (self.selectTagBlock) {
                self.selectTagBlock();
            }
        }
        
    }
    else
    {
        if (range.location ==0 && range.length==1) {
            textField.text = @"  ";
            
            self.isInput = YES;
            if (self.deleteTagBlock) {
                self.deleteTagBlock();
            }
        }
    }
    return self.isInput;
}


-(void)setIsInput:(BOOL)isInput
{
    if (isInput) {
        [self.shadeButton setHidden:YES];
    }else{
        [self.shadeButton setHidden:NO];
    }
    _isInput=isInput;
}

- (IBAction)cancelShade:(id)sender {
   
    self.isInput = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.text.length>3) {
        
         NSString *tagString =  [textField.text substringFromIndex:1];
        if (self.addTagBlock) {
            textField.text =@" ";
            self.addTagBlock(tagString);
        }
        
    }
    // 校验 1.至少两位 2.开头不能为空格
    return YES;
}


@end
