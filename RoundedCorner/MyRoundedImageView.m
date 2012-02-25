//
//  MyRoundedImageView.m
//  RoundedCorner
//
//  Created by Weipin Xia on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>  

#import "MyRoundedImageView.h"

@implementation MyRoundedImageView

@dynamic image;

- (void)dealloc {
  self.image = nil;
  
  [super dealloc];
}

- (void)drawRect:(CGRect)rect {
  CGRect bounds = self.bounds;
  
  [[UIColor whiteColor] set];
  UIRectFill(bounds);
  
  [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8.0] addClip];

  [self.image drawInRect:bounds];
}

#pragma mark - Accessor

- (void)setImage:(UIImage *)image {
  [image_ autorelease];
  image_ = [image retain];
  
  [self setNeedsDisplay];
}

- (UIImage *)image {
  return image_;
}

@end

