//
//  OrderBookCell.h
//  BitCheckIOS
//
//  Created by Albert on 22/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderBookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bidAmount;
@property (weak, nonatomic) IBOutlet UILabel *bidPrice;
@property (weak, nonatomic) IBOutlet UILabel *askAmount;
@property (weak, nonatomic) IBOutlet UILabel *askPrice;

@end
