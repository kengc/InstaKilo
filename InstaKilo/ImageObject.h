//
//  ImageObject.h
//  InstaKilo
//
//  Created by Kevin Cleathero on 2017-06-14.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageObject : NSObject

@property (nonatomic) NSString* location;
@property (nonatomic) NSString* subject;
@property (nonatomic) UIImage* image;

-(instancetype)initObjectWithImage:(UIImage *)image subject:(NSString *)subject andLocation:(NSString *)location;

+(NSMutableArray *)extractSubjects:(NSArray *)imageObjects;
+(NSMutableArray *)SortImageBySubject:(NSArray *)imageObjects;

+(NSMutableArray *)SortImageByLocation:(NSArray *)imageObjects;
+(NSMutableArray *)extractLocation:(NSArray *)imageObjects;

@end
