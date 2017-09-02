//
//  FriendsViewController.m
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "FriendsViewController.h"
#import "EditFriendsViewController.h"
#import "App.h"
#import "User.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.friends = [[User currentUser] friends];
    [self.tableView reloadData];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    User *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}

@end
