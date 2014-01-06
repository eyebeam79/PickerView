//
//  ViewController.m
//  PickerView
//
//  Created by SDT1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *data;
}

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

// 컴포넌트개수
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// 컴포넌트별로 항목개수
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 10;
    }
    else
    {
        return [data count];
    }
}

// 각컴포넌트와로우인데스에 해당하는 문자열 항목반환
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [NSString stringWithFormat:@"Row: %d", row];
    }
    else
    {
        return [data objectAtIndex:row];
    }
}

// 사용자선택시
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *item = [self pickerView:pickerView titleForRow:row forComponent:component];
    self.label.text = [NSString stringWithFormat:@"컴포넌트: %d 로우: %d 항목: %@", component, row, item];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = [[NSArray alloc] initWithObjects:@"item1", @"item2", @"item3", @"item4", @"item5", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
