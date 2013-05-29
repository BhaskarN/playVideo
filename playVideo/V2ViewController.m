//
//  V2ViewController.m
//  playVideo
//
//  Created by Bhaskar on 28/05/13.
//  Copyright (c) 2013 V2 Solutions. All rights reserved.
//

#import "V2ViewController.h"

@interface V2ViewController ()

@end

@implementation V2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takeVideo:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
         picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.movieURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
/*
-(void)viewDidAppear:(BOOL)animated
{
    self.movieController = [[MPMoviePlayerController alloc]init];
    [self.movieController setContentURL:self.movieURL];
    [self.movieController.view setFrame:CGRectMake(0, 0, 320, 476)];
    [self.view addSubview:self.movieController.view];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviePlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.movieController];
    
    [self.movieController play];
}
 */

-(void)moviePlaybackDidFinish:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [self.movieController stop];
    [self.movieController.view removeFromSuperview];
    self.movieController = nil;
}













@end
