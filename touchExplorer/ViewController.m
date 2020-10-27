//
//  ViewController.m
//  touchExplorer
//
//  Created by KMMX on 27/10/20.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *tapsLabel;
@property (weak, nonatomic) IBOutlet UILabel *touchesLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) updateLabelsFromTouches:(NSSet *) touches{
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSString *tapsMessage = [[NSString alloc]initWithFormat:@"%lu tapsdetected", (unsigned long)numTaps];
    self.tapsLabel.text = tapsMessage;
    NSUInteger numTouches = [touches count];
    NSString *touchMsg = [[NSString alloc] initWithFormat:@"%lu touches detected", (unsigned long)numTouches];
    self.touchesLabel.text = touchMsg;
    
}
//pragma mark - Touch Event Methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent*)event{self.messageLabel.text = @"Touches Began";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent*)event{
    self.messageLabel.text = @"Touches Cancelled";
    [self updateLabelsFromTouches:touches];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent*)event{
    self.messageLabel.text = @"Touches Ended.";
    [self updateLabelsFromTouches:touches];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent*)event{
    self.messageLabel.text = @"Drag Detected";
    [self updateLabelsFromTouches:touches];
}

@end
