//
//  ImageObject.m
//  InstaKilo
//
//  Created by Kevin Cleathero on 2017-06-14.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ImageObject.h"

@implementation ImageObject

-(instancetype)initObjectWithImage:(UIImage *)image subject:(NSString *)subject andLocation:(NSString *)location
{
    self = [super init];
    if (self) {
        self.location = location;
        self.subject = subject;
        self.image = image;
    }
    return self;
}

@end
