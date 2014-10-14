//
//  ViewController.m
//  CellDequeue
//
//  Created by jianleer on 14-10-10.
//  Copyright (c) 2014年 jianleer. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
@interface ViewController ()
{
    NSMutableArray*array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
}

-(void)createView
{
    array = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 20; i++) {
        NSMutableDictionary*dic = [NSMutableDictionary dictionary];
        [dic setObject:@"NO" forKey:@"checked"];
        [array addObject:dic];
    }
    
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID =@"cell";
    MyCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MyCell alloc] init];
    }
    
    NSMutableDictionary*dic = [array objectAtIndex:indexPath.row];
    if ([[dic objectForKey:@"checked"] isEqualToString:@"NO"]) {
        [dic setObject:@"NO" forKey:@"checked"];
        [cell setChecked:NO];
    }else
    {
        [dic setObject:@"YES" forKey:@"checked"];
        [cell setChecked:YES];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyCell*cell = (MyCell*)[tableView cellForRowAtIndexPath:indexPath];
    NSMutableDictionary*dic = [array objectAtIndex:indexPath.row];
    if ([[dic objectForKey:@"checked"] isEqualToString:@"NO"]) {
        [dic setObject:@"YES" forKey:@"checked"];
        [cell setChecked:YES];
    }else
    {
        [dic setObject:@"NO" forKey:@"checked"];
        [cell setChecked:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
