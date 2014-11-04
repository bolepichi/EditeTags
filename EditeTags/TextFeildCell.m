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

@property (weak, nonatomic) IBOutlet UITextField *textFeild;



@end

@implementation TextFeildCell

- (void)awakeFromNib {
    
    self.textFeild.delegate = self;
    
    self.isInput = YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"old string : %@",textField.text);
    
    if (range.location ==0 && range.length==1) {
        
        NSLog(@"选中最后一条");
        
        textField.text = @"  ";
        [self.shadeButton setHidden:NO];
        self.isInput = NO;
    }
    
    return self.isInput;
}
- (IBAction)cancelShade:(id)sender {

    [self.shadeButton setHidden:YES];
    self.isInput = YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.text.length>3) {
        
         NSString *tagString =  [textField.text substringFromIndex:1];
        
        NSLog(@"%@",tagString);
        
        if (self.addTagBlock) {
            self.addTagBlock(tagString);
        }
        
    }
    
    

    
    
    
    // 校验 1.至少两位 2.开头不能为空格
    return YES;
}


@end
