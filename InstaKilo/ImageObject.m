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


+(NSArray*)sortImageObjectsBySubject:(NSArray*)imageObjects{
    
    NSMutableArray* sortedData = [NSMutableArray array];
    NSArray* subjects = [ImageObject getUniqueSubjects:imageObjects];
    
    int sortedDataIndex = 0;
    for (NSString* subject in subjects){
        NSMutableArray* subjectImages = [NSMutableArray array];
        for (ImageObject* object in imageObjects){
            if ([object.subject isEqualToString:subject]){
                [subjectImages addObject:object];
            }
        }
        if ([subjectImages count] > 0){
            sortedData[sortedDataIndex] = subjectImages;
            sortedDataIndex++;
        }
    }
    return sortedData;
    
}

+(NSArray*) getUniqueSubjects:(NSArray*)imageObjects{
    NSArray* array = @[];
    for (ImageObject* imageObject in imageObjects){
        if(![array containsObject:imageObject.subject]){
            array = [array arrayByAddingObject:imageObject.subject];
        }
    }
    return array;
}
@end
