//
//  TBScheduleViewController.m
//  ToDoIt
//
//  Created by pin on 13-10-4.
//  Copyright (c) 2013年 dingyi. All rights reserved.
//

#import "TBScheduleViewController.h"
#import "NSCalendarCategories.h"
#import "NSDate+Components.h"

@interface TBScheduleViewController ()<CKCalendarViewDelegate, CKCalendarViewDataSource>
    @property (nonatomic, strong) NSMutableDictionary *data;
@end

@implementation TBScheduleViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setDataSource:self];
        [self setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CKCalendarViewDataSource

- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date
{
    //对date进行过滤判断，只对含有事件的日期添加事件 需要后台请求date下的任务纪录api 此处一定要做缓存！
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    NSString *dStr = [dateFormatter stringFromDate:date];
    
    //    NSLog(@"时区：%@ 当地时间：%@",[[dateFormatter timeZone] name], dStr);
    NSMutableArray *muArray = [[NSMutableArray alloc]initWithCapacity:1];
    NSArray *array = [[NSArray alloc]init];
    if ([dStr isEqualToString:[dateFormatter stringFromDate:[NSDate date]]]) {
        for (int i=0; i<4; i++) {
            NSString *title = [NSString stringWithFormat:@"任务中心卖家任务%d",i];
            CKCalendarEvent *event = [CKCalendarEvent eventWithTitle:title andDate:date andInfo:nil];
            [muArray addObject:event];
        }
    }
    array = muArray;
    return array;
}

#pragma mark - CKCalendarViewDelegate

// Called before/after the selected date changes
- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date
{
    NSLog(@"do 1");
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date
{
    NSLog(@"do 2");
}

//  A row is selected in the events table. (Use to push a detail view or whatever.)
- (void)calendarView:(CKCalendarView *)CalendarView didSelectEvent:(CKCalendarEvent *)event
{
    NSLog(@"do 3");
}

@end
