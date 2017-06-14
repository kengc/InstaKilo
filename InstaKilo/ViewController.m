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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray* photos;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
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

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //we want to deque the instance of the view that;s being passed in, in this case 'collectionView'. So deqeu it
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    //no need for loop since this function is called as many times as there are items in array.count
    ImageObject *imageObject = self.photos[indexPath.row];
 
    cell.imageViewCell.image = imageObject.image;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
