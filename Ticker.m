//
//  Ticker.m
//  BitCheckIOS
//
//  Created by Albert on 21/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import "Ticker.h"
#import "DataStore.h"

@interface Ticker ()
@property (weak, nonatomic) IBOutlet UILabel *ask;
@property (weak, nonatomic) IBOutlet UILabel *last;
@property (weak, nonatomic) IBOutlet UILabel *bid;

@end

@implementation Ticker

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self update];
}
- (IBAction)update {
    NSURL *url = [DataStore URLforTicker:@"btcusd"];
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    
    NSLog(@"%@",propertyListResults);
    
    self.last.text = [NSString stringWithFormat:@"%@ %@", @"Last:", propertyListResults[@"last"]];
    self.ask.text = [NSString stringWithFormat:@"%@ %@", @"Ask:", propertyListResults[@"ask"]];
    self.ask.textColor = [UIColor redColor];
    self.bid.text = [NSString stringWithFormat:@"%@ %@", @"Bid:", propertyListResults[@"bid"]];
    self.bid.textColor = [UIColor greenColor];
    
    
    //    NSString *ask = propertyListResults[@"ask"];
    //    NSString *bid = propertyListResults[@"bid"];
    //    NSString *high = propertyListResults[@"high"];
    //    NSString *last = propertyListResults[@"last"];
    //    NSString *low = propertyListResults[@"low"];
    //    NSString *open = propertyListResults[@"open"];
    //    NSString *timestamp = propertyListResults[@"timestamp"];
    //    NSString *volume = propertyListResults[@"volume"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
