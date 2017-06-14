//
//  PhotoCollectionViewCell.h
//  InstaKilo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageObject.h"

@interface PhotoCollectionViewCell : UICollectionViewCell

//@property (nonatomic)
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCell;

@end
