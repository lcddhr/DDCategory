//
//  AUCStore.m
//  AUCDemo
//
//  Created by  on 15/1/5.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "AUCStore.h"
#import "YTKKeyValueStore.h"
#import "UserModel.h"

#define SSJJSYCSSTORAGE_DBNAME      @"aucuser.db"
#define SSJJSYCSSTORAGE_TABLE_NAME  @"aucuser_table"
static AUCStore *aucStorage = nil;

@interface AUCStore()

@property(nonatomic,retain)YTKKeyValueStore *store;
@end

@implementation AUCStore



+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aucStorage = [[AUCStore alloc] init];
    });
    return aucStorage;
}

- (id)init
{
    self = [super init];
    if (self) {
        _store = [[YTKKeyValueStore alloc] initDBWithName:SSJJSYCSSTORAGE_DBNAME];
        [_store createTableWithName:SSJJSYCSSTORAGE_TABLE_NAME];
    }
    return self;
}

-(void)storeUserModel:(UserModel *)userModel
{
    NSDictionary *dic = @{@"token": userModel.token,@"realName":userModel.realName,@"staff":userModel.staff};
    [self.store putObject:dic withId:userModel.staff intoTable:SSJJSYCSSTORAGE_TABLE_NAME];
}



- (id)queryObjectById:(NSString *)objectId
{
    
    return [self.store getObjectById:objectId fromTable:SSJJSYCSSTORAGE_TABLE_NAME];
}

- (void)deleteObjectById:(NSString *)objectId
{
    return [self.store deleteObjectById:objectId fromTable:SSJJSYCSSTORAGE_TABLE_NAME];
}

- (NSArray *)queryAllMessage
{
    return  [self.store getAllItemsFromTable:SSJJSYCSSTORAGE_TABLE_NAME];
}

- (NSString *)queryUserToken:(UserModel *)userModel
{
    NSDictionary *dic = [self queryObjectById:userModel.staff];
    NSLog(@"ytmItem is %@",dic);
    
    if (!dic) {
        return @"";
    }
    
    NSString *appToken = dic[@"token"];

    return appToken;
}

- (void)deleteAllObject
{
    NSArray *array = [self.store getAllItemsFromTable:SSJJSYCSSTORAGE_TABLE_NAME];
    NSMutableArray *arrayIds = [NSMutableArray arrayWithCapacity:array.count];
    for (YTKKeyValueItem *item in array) {
        
        [arrayIds addObject:item.itemId];
    }
    NSLog(@"%@",arrayIds);
    return [self.store deleteObjectsByIdArray:arrayIds fromTable:SSJJSYCSSTORAGE_TABLE_NAME];
}

@end
