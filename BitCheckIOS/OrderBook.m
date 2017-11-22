//
//  OrderBook.m
//  BitCheckIOS
//
//  Created by Albert on 22/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import "OrderBook.h"
#import "OrderBookCell.h"
#import "DataStore.h"

@interface OrderBook ()
@property (nonatomic, strong) NSDictionary *orderBook;
@end

@implementation OrderBook

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Load the NIB file
    UINib *nib = [UINib nibWithNibName:@"OrderBookCell" bundle:nil];
    // Register this NIB, which contains the cell
    [self.tableView registerNib:nib forCellReuseIdentifier:@"OrderBookCell"];
    [self loadOrderBook];
}

- (void)loadOrderBook {
    
    NSURL *url = [DataStore URLforOrderBook:@"btcusd"];
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    self.orderBook = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    
//    NSLog(@"%@",self.orderBook[@"asks"]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.orderBook objectForKey:@"bids"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    // Get a new or recycled cell
    OrderBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderBookCell" forIndexPath:indexPath];
    cell.bidPrice.text = [self.orderBook objectForKey:@"bids"][indexPath.row][0];
    cell.bidPrice.textColor = [UIColor greenColor];
    cell.bidPrice.textAlignment = NSTextAlignmentRight;
    cell.bidAmount.text = [self.orderBook objectForKey:@"bids"][indexPath.row][1];
    cell.askPrice.text = [self.orderBook objectForKey:@"asks"][indexPath.row][0];
    cell.askPrice.textColor = [UIColor redColor];
    cell.askAmount.text = [self.orderBook objectForKey:@"asks"][indexPath.row][1];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
