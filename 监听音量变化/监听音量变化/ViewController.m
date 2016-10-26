//
//  ViewController.m
//  监听音量变化
//
//  Created by lhrmac on 16/8/16.
//  Copyright © 2016年 lhrmac. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
//    
//    volumeView.center = CGPointMake(-550,370);//设置中心点，让音量视图不显示在屏幕中
//    
//    [volumeView sizeToFit];
//    
//    [self.view addSubview:volumeView];
    //铃音和音量的切换
    /**
     *  音量可以为0，铃音不可以为0
     * 铃声音量主要控制手机铃声和通知铃声。多媒体音量主要控制游戏、视频、音乐的声音的输出。
     */
//    NSError *error;
//    [[AVAudioSession sharedInstance] setActive:YES error:&error];//加上这句可以在按音量键的时候不显示铃音提示视图,显示音量提示图
    

    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(volumeChanged:)
     
                                                 name:@"AVSystemController_SystemVolumeDidChangeNotification"
     
                                               object:nil];
    
    
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];//注，ios9上不加这一句会无效，加了这一句后，
    
    //在移除通知时候加上这句[[UIApplication sharedApplication] endReceivingRemoteControlEvents];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)volumeChanged:(NSNotification *)noti

{
    
    float volume =
    
    [[[noti userInfo]
      
      objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"]
     
     floatValue];
    
//    NSLog(@"volumn is %f", volume);
    if (volume == 1) {
        [self ThatCar];
    }
    
    
}
-(void)ThatCar{
    NSLog(@"我叫了一辆的士");
}

- (void)dealloc
{
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
}
@end
