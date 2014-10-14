//
//  MyCell.m
//  CellDequeue
//
//  Created by jianleer on 14-10-10.
//  Copyright (c) 2014年 jianleer. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
    [self createView];
}
-(id)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}
-(void)createView
{
    UIView*bgView =[[UIView alloc] initWithFrame:self.bounds];
    if (_checkImageView == nil) {
        _checkImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Unselected.png"]];
        _checkImageView.frame = CGRectMake(10, 10, 29, 29);
        [bgView addSubview:_checkImageView];
    }
    
    
    [self addSubview:bgView];
}

-(void)setChecked:(BOOL)checked
{
    if (checked) {
        _checkImageView.image = [UIImage imageNamed:@"Selected.png"];
    }else
    {
        _checkImageView.image = [UIImage imageNamed:@"Unselected.png"];

    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
