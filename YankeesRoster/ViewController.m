//
//  ViewController.m
//  YankeesRoster
//
//  Created by Yuichi Fujiki on 10/6/12.
//  Copyright (c) 2012 Yuichi Fujiki. All rights reserved.
//

#import "ViewController.h"
#import "BallParkView.h"

static inline BOOL isIphone5() {
    return ([UIScreen mainScreen].bounds.size.height >= 568);
}

@interface ViewController ()

@property (nonatomic, weak) IBOutlet BallParkView * parkView;
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSArray * rosterNames;
@property (nonatomic, strong) NSArray * rosterPositions;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.rosterNames = @[@"Derek Jeter",
                        @"Ichiro Suzuki",
                        @"Alex Rodriguez",
                        @"Robinson Cano",
                        @"Nick Swisher",
                        @"Mark Teixeira",
                        @"Curtis Granderson",
                        @"Raul Ibanez",
                        @"Russel Martin",
                        @"Hiroki Kuroda"];
    
    self.rosterPositions = @[@"SS",
                            @"LF",
                            @"3B",
                            @"2B",
                            @"RF",
                            @"1B",
                            @"CF",
                            @"DH",
                            @"C",
                            @"P"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d. %@", indexPath.row, self.rosterNames[indexPath.row]];
    cell.detailTextLabel.text = self.rosterPositions[indexPath.row];
    
    if(isIphone5())
    {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    else
    {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:13];
    }
    return cell;
}
@end
