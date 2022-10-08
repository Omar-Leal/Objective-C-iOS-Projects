
//
//  Created by Omar Leal
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITableView *otherTable;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.otherTable = [[UITableView alloc] initWithFrame: CGRectMake(0, 300, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.otherTable]; // array
    self.navigationItem.title = @"Dragon Ball Z";
    self.otherTable.backgroundColor = [UIColor orangeColor];
    
    [self fetchData];
    self.view.backgroundColor = [UIColor orangeColor];
    self.otherTable.dataSource = self;
    self.otherTable.delegate = self;
   
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topo"];
    // In fist instance the cell does not exist,
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"Son Goku";
    cell.imageView.image = [UIImage imageNamed:@"goku"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



- (void)fetchData {
  
    NSString *URL_API = @"https://rickandmortyapi.com/api/character";
    NSURL *APIURL = [NSURL URLWithString: URL_API];
    
    [[NSURLSession.sharedSession dataTaskWithURL:APIURL completionHandler:^(NSData * _Nullable apiData, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        /**
            NSString *parsedData = [[NSString alloc] initWithData:apiData encoding:NSUTF8StringEncoding];
            NSLog(@"%@", parsedData);
         
         */
            
            NSError *err;
            NSDictionary *rickAndMortyDataJSON = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error: &err];
        NSArray *arrayData = [rickAndMortyDataJSON objectForKey:@"results" ];
        
        for (NSDictionary *each in arrayData  ) {
            NSLog(@"%@", each[@"results"]);
        }
       
        /**
        for (NSDictionary *eachCharacter in rickAndMortyDataJSON) {
            NSString *name = eachCharacter[@"results"];
            NSLog(@" fetching? %@", name);
        }
            
         */
        
        
        }] resume];
    
    
    
}



@end

