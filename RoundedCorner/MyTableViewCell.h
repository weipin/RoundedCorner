//
//  MyTableViewCell.h
//  RoundedCorner
//
//  Created by Weipin Xia on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell {
  UIImageView *myImageView_;
}

@property (nonatomic, retain) IBOutlet UIImageView* myImageView;

@end
