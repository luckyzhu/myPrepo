//
//  CoreAnimationViewController.m
//  summary
//
//  Created by NewBoy on 2018/4/2.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import "testCoreAnimantionViewController.h"
#import <CoreData/CoreData.h>
#import "Student.h"

@interface CoreAnimationViewController ()
@property(nonatomic, strong)NSManagedObjectContext *context;

@end

@implementation CoreAnimationViewController

- (NSManagedObjectContext *)context {
if (_context == nil) {
    // 创建上下文对象，并发队列设置为主队列
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];

    // 创建托管对象模型，并使用Student.momd路径当做初始化参数
    // .xcdatamodeld文件 编译之后变成.momd文件  （.mom文件）
    NSURL *modelPath = [[NSBundle mainBundle] URLForResource:@"summary" withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelPath];

    // 创建持久化存储调度器
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

    // 创建并关联SQLite数据库文件，如果已经存在则不会重复创建
    NSString *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    dataPath = [dataPath stringByAppendingFormat:@"/%@.sqlite",@"StudentStore"];

    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:dataPath] options:nil error:nil];

    // 上下文对象设置属性为持久化存储器
    _context.persistentStoreCoordinator = coordinator;
}
return _context;
}

- (Student *)insert {
    NSError *error = nil;

    // 开始创建托管对象，并指明好创建的托管对象所属实体名
     Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"StudentStore" inManagedObjectContext:self.context];
     stu.name = @"小明";
     stu.age = arc4random() % 100;
     stu.buySymbol = @"TX";
     stu.moneyCount = 1000 + arc4random() % 100;

    if ([self.context hasChanges] && ![self.context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        _resultLbe.text = [NSString stringWithFormat:@"CoreData Error:%@",error.userInfo];
        abort();
        return nil;
    } else {
//        _resultLbe.text = @"插入数据成功";
    }

    return stu;
}

- (void)delete {
   // 获取数据的请求对象，指明对实体进行删除操作，以StudentStore为例
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"StudentStore"];

    // 通过创建谓词对象，然后过滤掉符合要求的对象，也就是要删除的对象 删除对象属性为moneyCount=1003.87的对象
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"moneyCount = 1003.87"];
    request.predicate = predicate;

    // 通过执行获取操作，找到要删除的对象即可
    NSError *error = nil;
    NSArray<Student *> *StudentStores = [self.context executeFetchRequest:request error:&error];

    // 开始真正操作，一一遍历，遍历符合删除要求的对象数组，执行删除操作
    [StudentStores enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.context deleteObject:obj];
    }];

    // 最后保存数据，保存上下文。
    if (self.context.hasChanges) {
        [self.context save:nil];
    }

    // 错误处理
    if (error) {
        NSLog(@"CoreData Delete Data Error : %@", error);
    }
}

- (void)update {
   // 获取数据的请求对象，指明对实体进行删除操作，以StudentStore为例
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"StudentStore"];

    // 通过创建谓词对象，然后过滤掉符合要求的对象，也就是要删除的对象 删除对象属性为moneyCount=1003.87的对象
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age = %d",43];
    request.predicate = predicate;

    // 通过执行获取操作，找到要删除的对象即可
    NSError *error = nil;
    NSArray<Student *> *StudentStores = [self.context executeFetchRequest:request error:&error];

    // 开始真正操作，一一遍历，遍历符合删除要求的对象数组，执行删除操作
    [StudentStores enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.buySymbol = @"CCCC";
    }];

    // 最后保存数据，保存上下文。
    if (self.context.hasChanges) {
        [self.context save:nil];
    }

    // 错误处理
    if (error) {
        NSLog(@"CoreData Delete Data Error : %@", error);
    }
}

- (void)search {
   //  获取数据的请求对象，指明对实体进行查询操作，以StudentStore为例
   NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"StudentStore"];

   // 执行获取操作，获取所有StudentStore托管对象
   NSError *error = nil;
   NSArray<Student *> *StudentStores = [self.context executeFetchRequest:request error:&error];
   [StudentStores enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       NSLog(@"StudentStore Name : %@, moneyCount : %f, buySymbol : %@", obj.name, obj.moneyCount, obj.buySymbol);
   }];

   // 错误处理
   if (error) {
       NSLog(@"CoreData Ergodic Data Error : %@", error);
   }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button setTitle:@"插入按钮" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    button.exclusiveTouch = YES;
    [self.view addSubview:button];

    UIButton *button2 = [[UIButton alloc]init];
    button2.frame = CGRectMake(100, 200, 100, 50);
    [button2 setTitle:@"删除按钮" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    button2.exclusiveTouch = YES;
    [self.view addSubview:button2];

    UIButton *button3 = [[UIButton alloc]init];
    button3.frame = CGRectMake(100, 300, 100, 50);
    [button3 setTitle:@"更新按钮" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor redColor];
    [button3 addTarget:self action:@selector(updateClick) forControlEvents:UIControlEventTouchUpInside];
    button3.exclusiveTouch = YES;
    [self.view addSubview:button3];

     UIButton *button4 = [[UIButton alloc]init];
     button4.frame = CGRectMake(100, 400, 100, 50);
     [button4 setTitle:@"查询按钮" forState:UIControlStateNormal];
     button4.backgroundColor = [UIColor redColor];
     [button4 addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
     button4.exclusiveTouch = YES;
     [self.view addSubview:button4];

}

- (void)searchClick {

    [self search];
}

- (void)updateClick {

    [self update];
}

- (void)deleteClick {

    [self delete];
}

- (void)btnClick:(UIButton *)button {

//    [self presentViewController:[[UINavigationController alloc]initWithRootViewController:[testCoreAnimantionViewController new]] animated:YES completion:nil];

    [self insert];

    return;
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);

    NSString *orderNumber = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSLog(@"唯一标示1111-----%@",[orderNumber lowercaseString]);

    NSString *uuid2 = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    uuid2 = [uuid2 stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSLog(@"唯一标示2222-----%@",uuid2);
}


@end
