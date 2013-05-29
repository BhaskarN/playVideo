//
//  V2ViewController.h
//  playVideo
//
//  Created by Bhaskar on 28/05/13.
//  Copyright (c) 2013 V2 Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface V2ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(copy, nonatomic) NSURL *movieURL;
@property(strong, nonatomic) MPMoviePlayerController *movieController;
- (IBAction)takeVideo:(id)sender;

@end
