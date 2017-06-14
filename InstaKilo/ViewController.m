//
//  ViewController.m
//  InstaKilo
//
//  Created by Kevin Cleathero on 2017-06-13.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ViewController.h"
#import "ImageObject.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoCollectionReusableView.h"



typedef enum ImageObjectSortOrder{
    ImageObjectSortOrderSubject,
    ImageObjectSortOrderLocation
} ImageObjectSortOrder;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray* photos;
@property (nonatomic) NSArray *subjects;
@property (nonatomic) NSString *currentSubject;

@property (nonatomic) ImageObjectSortOrder sort;
@property (nonatomic) NSArray* sortedData;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    self.subjects = @[@"Synth", @"Bike", @"Cat"];
    
    self.photos = @[
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"ps3100.jpg"] subject:@"synth" andLocation:@"Vancouver"],
                        [[ImageObject alloc]initObjectWithImage:[UIImage imageNamed:@"GRP_Synth_A8"] subject:@"synth" andLocation:@"Vancouver"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"synthi100.jpg"] subject:@"synth" andLocation:@"Vancouver"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"2_3pRwlgM"] subject:@"bike" andLocation:@"Squamish"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"intestinal"] subject:@"bike" andLocation:@"Squamish"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"trails"] subject:@"bike" andLocation:@"Squamish"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"cat2"] subject:@"cat" andLocation:@"Japan"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"maxresdefault-1"] subject:@"cat" andLocation:@"Japan"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"maxresdefault"] subject:@"cat" andLocation:@"Japan"],
                        [[ImageObject alloc] initObjectWithImage:[UIImage imageNamed:@"korg-ps3200"] subject:@"synth" andLocation:@"Vancouver"]];
    
    self.collectionView.allowsMultipleSelection = YES;

    
    //set default sort to subject
    self.sort = ImageObjectSortOrderSubject;
    //call sortData so we can sort based on type of sort
    self.sortedData = [self sortData];
}

-(NSArray*)sortData{
    if (self.sort == ImageObjectSortOrderSubject){
        return [ImageObject sortImageObjectsBySubject:self.photos];
    } else {
        //return [ImageObject sortImageObjectsByLocation:self.photos];
        return nil;
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //return self.subjects.count;
    return [self.sortedData count];
 
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //return self.photos.count;
    return [self.sortedData[section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //we want to deque the instance of the view that;s being passed in, in this case 'collectionView'. So deqeu it
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    //if current subject is synth then check and display only synth
    //if current subject is cat then display only cat
    
    //ImageObject *imageObject = self.photos[indexPath.row];
    
    NSLog(@"sorted array count: %lu", (unsigned long)self.sortedData.count);
    
    ImageObject *imageObject = self.sortedData[indexPath.section][indexPath.row];
    
    cell.imageViewCell.image = imageObject.image;

    
    //no need for loop since this function is called as many times as there are items in array.count
  
 
   // cell.imageViewCell.image = imageObject.image;
    
    return cell;
}

//this reuses a view (header view with label on it)
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //////////////
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        PhotoCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        //NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%li", indexPath.section + 1];
        
        //self.currentSubject = [self.subjects objectAtIndex:indexPath.section];
        
    
        NSLog(@"indexPath: %@ row: %ld", indexPath, (long)indexPath.section);
        
        headerView.sectionLabel.text = [self.subjects objectAtIndex:indexPath.section];
        
        reusableview = headerView;
    }
    
    return reusableview;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
