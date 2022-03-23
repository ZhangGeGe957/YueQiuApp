//
//  EditController.m
//  YueQiu
//
//  Created by haoqianbiao on 2022/3/21.
//

#import "EditController.h"


#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@interface EditController ()

@end

@implementation EditController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.titleString;
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIView* backgroundView = [[UIView alloc] init];
    backgroundView.layer.cornerRadius = 20;
    backgroundView.layer.borderColor = [UIColor blackColor].CGColor;
    backgroundView.layer.borderWidth = 1;
    [self.view addSubview:backgroundView];
    
    self.textView = [[UITextView alloc] init];
    self.textView.delegate = self;
    self.textView.font = [UIFont systemFontOfSize:17];
    [backgroundView addSubview:self.textView];
    if ([self.titleString isEqualToString:@"修改我的昵称"] || [self.titleString isEqualToString:@"修改我的邮箱"]) {
        backgroundView.frame = CGRectMake(10, 100, W - 20, 40);
        self.textView.frame = CGRectMake(5, 5, W - 30, 30);
        
    } else {
        self.placeHolderLabel = [[UILabel alloc] init];
        self.placeHolderLabel.numberOfLines = 0;
        self.placeHolderLabel.text = @"请输入内容最多140字";
        self.placeHolderLabel.textColor = [UIColor grayColor];
        self.placeHolderLabel.backgroundColor =[UIColor clearColor];
        self.residueLabel = [[UILabel alloc] initWithFrame:CGRectMake(W - 100, 140, 100, 20)];
        self.residueLabel.backgroundColor = [UIColor clearColor];
        self.residueLabel.font = [UIFont systemFontOfSize:15];
        self.residueLabel.text = [NSString stringWithFormat:@"140/140"];
        self.residueLabel.textColor = [[UIColor grayColor]colorWithAlphaComponent:0.5];
        [backgroundView addSubview:self.residueLabel];
        
        backgroundView.frame = CGRectMake(10, 100, W - 20, 160);
        self.textView.frame = CGRectMake(5, 5, W - 30, 150);
        [backgroundView addSubview:self.placeHolderLabel];
    }
}

- (void)pressDone {
    
    if ([self.titleString isEqualToString:@"修改我的邮箱"] && ![self isValidateEmail:self.textView.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"邮箱格式错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.textView.text = @"";
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"EditToEdit" object:nil userInfo:@{@"content":_textView.text, @"flag":_titleString}];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
- (BOOL)isValidateEmail:(NSString *)Email {
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:Email];
}
- (float)hGetStatusbarHeight {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *hStatusBarManager =  windowScene.statusBarManager;
    return hStatusBarManager.statusBarFrame.size.height;
}

//获取导航栏高度
- (float)hGetNavigationbarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView resignFirstResponder];
}

-(void)textViewDidChange:(UITextView*)textView

{

    if([textView.text length] == 0){

      self.placeHolderLabel.text = @"请输入你的意见最多140字";

    }else{
       self.placeHolderLabel.text = @"";//这里给空
    }

    //计算剩余字数   不需要的也可不写

    NSString *nsTextCotent = textView.text;

    NSUInteger existTextNum = [nsTextCotent length];

    NSUInteger remainTextNum = 140 - existTextNum;

    self.residueLabel.text = [NSString stringWithFormat:@"%lu/140",remainTextNum];

}

//设置超出最大字数（140字）即不可输入 也是textview的代理方法

-(BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {

    if (range.location >= 140) {

     return NO;

    } else {
       return YES;

    }
}
@end
