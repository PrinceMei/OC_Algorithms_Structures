//
//  main.m
//  07-计数排序(CountingSort)
//
//  Created by 程金伟 on 2019/10/6.
//  Copyright © 2019 cjw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWTimeTool.h"
NSMutableArray *_counts,*_sortArray;

// 1、计数排序
void countingSort()
{
	// 1-1、寻找最大值
	NSString *max = _sortArray[0];
	for (int i = 1; i < _sortArray.count; i++) {
		if([max integerValue] < [_sortArray[i] integerValue]){
			max = _sortArray[i];
		}
	}
	
	// 1-2、统计数值出现的个数
	// 数组占位
	NSMutableArray *counts = [NSMutableArray arrayWithCapacity:max.intValue + 1];
	for (int i = 0; i < max.intValue + 1; i++) {
		[counts addObject:[NSString stringWithFormat:@"%d",0]];
	}
	// 数组
	NSInteger temp;
	for (int i = 0; i < _sortArray.count; i++) {
		int count = [_sortArray[i] intValue];
		temp = [counts[count] integerValue];
		counts[count] = [NSString stringWithFormat:@"%ld",++temp];
	}
	
	// 1-3、输出排好序的数据
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:_sortArray.count];
	for (int i = 0; i < counts.count; i++) {
		NSInteger temp = [counts[i] integerValue];
		while (temp-- > 0) {
			[results addObject:[NSString stringWithFormat:@"%d",i]];
		}
	}
	NSLog(@"%@",results);
	
}

// 1、计数排序优化(开辟空间优化由max减少到max-min+1)
void countingSort2()
{
	// 1-1、寻找最大值、最小值
	NSString *max = _sortArray[0];
	NSString *min = _sortArray[0];
	for (int i = 1; i < _sortArray.count; i++) {
		if([max integerValue] < [_sortArray[i] integerValue]){
			max = _sortArray[i];
		}
		if ([min integerValue] > [_sortArray[i] integerValue]) {
			min = _sortArray[i];
		}
	}
	
	// 1-2、统计数值出现的个数
	// 数组占位
	NSMutableArray *counts = [NSMutableArray arrayWithCapacity:max.intValue - min.intValue + 1];
	for (int i = 0; i < max.intValue - min.intValue + 1; i++) {
		[counts addObject:[NSString stringWithFormat:@"%d",0]];
	}
	// 数组
	NSInteger temp;
	for (int i = 0; i < _sortArray.count; i++) {
		int count = [_sortArray[i] intValue];
		temp = [counts[count - min.intValue] integerValue];
		counts[count - min.intValue] = [NSString stringWithFormat:@"%ld",++temp];
	}
	
	// 1-3、输出排好序的数据
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:_sortArray.count];
	for (int i = 0; i < counts.count; i++) {
		NSInteger temp = [counts[i] integerValue];
		while (temp-- > 0) {
			[results addObject:[NSString stringWithFormat:@"%d",i + min.intValue]];
		}
	}
	NSLog(@"%@",results);
	
}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"0.34",@"0.47",@"0.99",@"0.84",@"0.46",@"0.37",@"0.36",@"0.79", nil];
		//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"9",@"56",@"19",@"28",@"37",@"34",@"10",@"9", nil];
		//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"126",@"69",@"593",@"23",@"6",@"89",@"54",@"8", nil];
		//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10",@"9",@"7",@"6",@"5",@"4",@"3", nil];
		//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"6",@"6",@"6",@"12",@"14", nil];
		//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"12",@"4",@"6",@"2", nil];
		//		NSMutableArray *array = [NSMutableArray arrayWithObjects:@"3",@"6",@"11",@"18",@"8",@"10",@"12",@"14", nil];
		//	 	NSMutableArray *array = [NSMutableArray arrayWithObjects:@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1", nil];
				
		//		NSMutableArray *array = [NSMutableArray array];
		//		for (int i = 0; i < 10000; i++) {
		//			[array addObject:[NSString stringWithFormat:@"%d",arc4random() % (10000+1)]];
		//		}
				_sortArray = array.mutableCopy;
		//		CWTimeTool *time = [[CWTimeTool alloc] init];
		//		[time executeTimesForFunction:^{
		//			countingSort2();
		//		}];
	}
	return 0;
}
