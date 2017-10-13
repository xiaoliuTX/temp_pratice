//
//  ViewController.m
//  UITableviewFold
//
//  Created by xiaoliuTX on 2017/8/8.
//  Copyright © 2017年 xiaoliuTX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *headSelectStateArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = [NSMutableArray arrayWithArray:@[@{@"head":@"一月",@"values":@[@"1.1",@"1.2",@"1.3"]},
                                                      @{@"head":@"二月",@"values":@[@"2.4",@"2.5",@"2.6"]}
                                                      ]];
    self.headSelectStateArray = [NSMutableArray arrayWithArray:@[@0,@0]];
    
    [self.tableView reloadData];
    
    self.tableView.tableFooterView = [UIView new];
    
    
    NSString *name1 = [NSString stringWithFormat:@"stringTestOne"];
    __weak NSString *name2 = name1;
    NSLog(@"name1:%@", name1);
    NSLog(@"name2:%@", name2);
    name1 = nil;
    NSLog(@"name1:%@", name1);
    NSLog(@"name2:%@", name2);
    //第二个
    NSString *a1 = [[NSString alloc] initWithFormat:@"stringTestTwo"];
    __weak NSString *a2 = a1;
    NSLog(@"a1:%@", a1);
    NSLog(@"a2:%@", a2);
    a1 = nil;
    NSLog(@"a1:%@", a1);
    NSLog(@"a2:%@", a2);
    //第三个
    NSString *b1 = @"stringTestThree";
    __weak NSString *b2 = b1;
    NSLog(@"b1:%@", b1);
    NSLog(@"b2:%@", b2);
    b1 = nil;
    NSLog(@"b1:%@", b1);
    NSLog(@"b2:%@", b2);
//    [self.tableView regis]
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.headSelectStateArray[section] intValue] == 0) {
        return [[self.dataArray[section] valueForKey:@"values"] count];
    } else {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.dataArray[indexPath.section] valueForKey:@"values"] objectAtIndex:indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 100, 40)];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(foldTablviews:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:[self.dataArray[section] valueForKey:@"head"] forState:UIControlStateNormal];
    button.tag = section;
    return button;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)foldTablviews:(UIButton*)button {
//    button.selected = !button.isSelected;
////    [button setSelected:!button.isSelected];
    self.headSelectStateArray[button.tag] = @(!([self.headSelectStateArray[button.tag] boolValue]));
    
    [self.tableView reloadData];
}



@end
