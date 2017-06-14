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


+(NSMutableArray *)SortImageBySubject:(NSArray *)imageObjects{

    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    NSMutableArray *subjectArray = [self extractSubjects:imageObjects];
    int index = 0;
    for(int i = 0; i < subjectArray.count; i++){
        NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
        for(ImageObject *imageObj in imageObjects){
            if([subjectArray[i] isEqualToString:imageObj.subject]){
                [imagesArray addObject:imageObj];
            }
        }
        //adding an index to indicate sections - check "po sortedArray" in console to observe
        if ([imagesArray count] > 0){
            sortedArray[index] = imagesArray;
            index++;
        }
    }
    
    return sortedArray;
}


+(NSMutableArray *)extractSubjects:(NSArray *)imageObjects{
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for(ImageObject *imageObj in imageObjects){
        
        //if the tempArray doesn't contain the current subject then add it in, otherwise skip to the next
        if(![tempArray containsObject:imageObj.subject]){
            [tempArray addObject:imageObj.subject];
        }
    }
    return tempArray;
}



+(NSMutableArray *)SortImageByLocation:(NSArray *)imageObjects{
    
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    NSMutableArray *subjectArray = [self extractLocation:imageObjects];
    int index = 0;
    for(int i = 0; i < subjectArray.count; i++){
        NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
        for(ImageObject *imageObj in imageObjects){
            if([subjectArray[i] isEqualToString:imageObj.location]){
                [imagesArray addObject:imageObj];
            }
        }
        //adding an index to indicate sections - check "po sortedArray" in console to observe
        if ([imagesArray count] > 0){
            sortedArray[index] = imagesArray;
            index++;
        }
    }
    
    return sortedArray;
}

+(NSMutableArray *)extractLocation:(NSArray *)imageObjects{
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for(ImageObject *imageObj in imageObjects){
        
        //if the tempArray doesn't contain the current subject then add it in, otherwise skip to the next
        if(![tempArray containsObject:imageObj.location]){
            [tempArray addObject:imageObj.location];
        }
    }
    return tempArray;
}


@end
