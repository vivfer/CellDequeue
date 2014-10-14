//
//  MyCell.h
//  CellDequeue
//
//  Created by jianleer on 14-10-10.
//  Copyright (c) 2014年 jianleer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

{
    BOOL _checked;
    UIImageView*_checkImageView;
    //UIButton*_button;
}

-(void)setChecked:(BOOL)checked;
-(id)init;
@end
