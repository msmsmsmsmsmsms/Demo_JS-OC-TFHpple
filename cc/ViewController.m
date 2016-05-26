//
//  ViewController.m
//  cc
//
//  Created by wgw on 16/5/25.
//  Copyright © 2016年 wgw. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"

@interface ViewController ()<UIWebViewDelegate>
{
    NSString * sstr ;
}

@property(nonatomic,strong)UIWebView * web ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL * url = [NSURL URLWithString:@"http://api.967111.com/meeting/stateDetail.do?stateId=321&schoolId=2522"] ;
    NSURLRequest * request = [NSURLRequest requestWithURL:url] ;
    
    
    self.web = [[UIWebView alloc]initWithFrame:self.view.bounds] ;
    [self.web loadRequest:request] ;
    self.web.delegate = self ;
    
    [self.view addSubview:self.web] ;
    
//<img src="http://teacher.967111.com/publicupload/image/20160523/20160523102353_374.jpg" alt="..." class="carousel-inner img-responsive img-rounded">
    
    //
    NSData * htmlData = [NSData dataWithContentsOfURL:url] ;
    TFHpple * htmls = [[TFHpple alloc]initWithData:htmlData isXML:YES] ;
    
   // NSLog(@"%@",htmls);
    
    NSArray * dataArray = [htmls searchWithXPathQuery:@"//img"] ;
    
    
    for (TFHppleElement * element in dataArray) {
    
        if ([[element objectForKey:@"class"]isEqualToString:@"img-rounded carousel-inner img-responsive img-rounded"]) {

            NSLog(@" taggggg ====  %@",element.tagName) ;
            
            NSLog(@" attr %@",element.attributes) ;
            
            sstr = [element.attributes objectForKey:@"src"] ;
            
            NSLog(@"%@",sstr) ;
            
            
            
            
  
            
        }
    
    }
    
    
}



@end
