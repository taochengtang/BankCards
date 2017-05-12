//
//  ViewController.m
//  BankCards
//
//  Created by 逍遥子 on 15/11/3.
//  Copyright © 2015年 QuantGroup. All rights reserved.
//

#import "ViewController.h"
#import "BankCards.h"
@interface ViewController ()<UITextFieldDelegate>

//银行卡号码输入框
@property (strong, nonatomic)UITextField *cardNumberTf;
//银行卡类型显示
@property (strong, nonatomic)UILabel *cardTypeLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =nil;
    
    switch (indexPath.row) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cardNumberCell" forIndexPath:indexPath];
            
            _cardNumberTf =(UITextField *)[cell.contentView viewWithTag:101];
            _cardNumberTf.delegate =self;
            

        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cardTypeCell" forIndexPath:indexPath];
            
            _cardTypeLab =(UILabel *)[cell.contentView viewWithTag:102];
            _cardTypeLab.text =@"卡类型:";
            _cardTypeLab.textColor =[UIColor grayColor];
            [self custemCardtypeContent];


        }
            break;
            
        default:
            break;
    }
    // Configure the cell...
    
    return cell;
}

#pragma mark -UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (_cardNumberTf ==textField) {
        
        _cardTypeLab.text =[NSString stringWithFormat:@"卡类型: %@",[BankCards returnBankName:textField.text]] ;
        
        [self custemCardtypeContent];

        
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (_cardNumberTf ==textField && textField.text.length>16) {
        
        _cardTypeLab.text =[NSString stringWithFormat:@"卡类型: %@",[BankCards returnBankName:textField.text]] ;
        
        [self custemCardtypeContent];
    }

    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//自定义银行卡类型显示内容
-(void)custemCardtypeContent
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_cardTypeLab.text];
    //        颜色设置
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,4)];
    
    _cardTypeLab.attributedText = str;

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
