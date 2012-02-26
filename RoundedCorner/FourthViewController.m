//
//  FourthViewController.m
//  RoundedCorner
//
//  Created by Weipin Xia on 2/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "MyTableViewCell.h"

#import "FourthViewController.h"

@interface FourthViewController () 

- (UIImage *)imageByComposingImage:(UIImage *)image withMaskImage:(UIImage *)maskImage;

@end


@implementation FourthViewController

- (id)initWithStyle:(UITableViewStyle)style {
  if (self = [super initWithStyle:style]) {
    self.tabBarItem.title = @"4";
  }
  
  return self;
}

- (void)initReloadable {
  self.tableView.rowHeight = kAppTableViewRowHeight;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] 
       forCellReuseIdentifier:@"MyCell"];
}

- (void)deallocReloadable {
  
}

- (void)dealloc {
  [self deallocReloadable];
  
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self initReloadable];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  
  [self deallocReloadable];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return kAppTableViewRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"MyCell";
  
  MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  NSUInteger index = indexPath.row % 10;
  NSString *filename = [NSString stringWithFormat:@"%d.png", index];  
  UIImage *image = [UIImage imageNamed:filename];
  UIImage *roundedImage = [self imageByComposingImage:image 
                                        withMaskImage:[UIImage imageNamed:@"mask.png"]];
  
  cell.myImageView.image = roundedImage;
  return cell;
}

#pragma mark - Helper

- (UIImage *)imageByComposingImage:(UIImage *)image withMaskImage:(UIImage *)maskImage {
	CGImageRef maskImageRef = maskImage.CGImage; 
	CGImageRef maskRef = CGImageMaskCreate(CGImageGetWidth(maskImageRef),
                                         CGImageGetHeight(maskImageRef),
                                         CGImageGetBitsPerComponent(maskImageRef),
                                         CGImageGetBitsPerPixel(maskImageRef),
                                         CGImageGetBytesPerRow(maskImageRef),
                                         CGImageGetDataProvider(maskImageRef), NULL, false);
	
  CGImageRef newImageRef = CGImageCreateWithMask(image.CGImage, maskRef);
  CGImageRelease(maskRef);
  UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
  CGImageRelease(newImageRef);

  return newImage;
}

@end
