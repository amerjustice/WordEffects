//
//  main.m
//  WordEffects
//
//  Created by Susan Justice on 2016-05-02.
//  Copyright © 2016 Amer Justice. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        char yourNumber[255];
        char yourChar[255];
        int yourValue;
        BOOL letsPlay = YES;
        BOOL letsWork = NO;
        char playAgain[255];
        NSMutableString *shiftString;
        NSMutableString *resultMutableString;
        
        while (letsPlay) {
            printf("Choose which one you like to see: \n1. Uppercase \n2. Lowercase \n3. Numberize \n4. Canadianize \n5. Response \n6. Space-It \n7. Word Count \n8. Puncutation Removal \nYour Choice: ");
            
            fgets(yourNumber,255,stdin);
            
             NSMutableString *numToOperation = [[[NSString stringWithCString:yourNumber encoding:NSASCIIStringEncoding] substringToIndex:1] mutableCopy];
            yourValue = [numToOperation intValue];
            
            NSLog(@"You chose %d", yourValue);
            
            printf("Enter your text: ");
            fgets(yourChar,255,stdin);
            
            shiftString = [[[NSString stringWithUTF8String:yourChar] stringByReplacingOccurrencesOfString:@"\n" withString:@""] mutableCopy];
            
            if(yourValue == 1){
                resultMutableString = [[shiftString uppercaseString] mutableCopy];
                NSLog(@"answer: \n%@", resultMutableString);
            }else if(yourValue == 2){
                NSString *answerLowerCase = [shiftString lowercaseString];
                NSLog(@"answer: \n%@", answerLowerCase);
        
            }else if(yourValue == 3){
                NSNumber *answerNumber = @([shiftString floatValue]);
                NSLog(@"answer: \n%@", answerNumber);
                
            }else if(yourValue == 4){
                NSString *answerAppendString = [shiftString stringByAppendingString:@", eh?"];
                NSLog(@"answer: \n%@", answerAppendString);
            }else if(yourValue == 5){
                NSString *myResponse = [shiftString substringFromIndex: [shiftString length] - 1];
                
                if([myResponse isEqualToString:@"?"]){
                    NSLog(@"I don't know.");
                }else if([myResponse isEqualToString:@"!"]){
                    NSLog(@"Whoa, calm down!");
                }else {
                    NSLog(@"Yes, I agree.");
                }
                
            }else if(yourValue == 6){
                NSString *answerSpaceString = [shiftString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                NSLog(@"answer: \n%@", answerSpaceString);
            }else if(yourValue == 7){
                NSArray *words = [shiftString componentsSeparatedByString:@" "];
                NSLog(@"Word count is: \n%lu", [words count]);
            }else if(yourValue == 8){
                NSString *answerPuncRemoval = [[shiftString componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@" "];
                NSLog(@"puncucation removal: \n%@", answerPuncRemoval);
            }
            
            letsWork = NO;
            
            while(!letsWork){
                printf("Would you like to play again? [Y/N]?");
                fgets(playAgain, 255, stdin);
                
                NSMutableString *playAgainYN = [[[NSString stringWithUTF8String:playAgain] stringByReplacingOccurrencesOfString:@"\n" withString:@""] mutableCopy];
                if([playAgainYN isEqualToString:@"Y"]){
                    letsPlay = YES;
                    letsWork = YES;
                    NSLog(@"%@",playAgainYN);
                    printf("...Here we go again!\n\n");
                }else if([playAgainYN isEqualToString:@"N"]){
                    letsPlay = NO;
                    letsWork = YES;
                    printf("...terminating program \nprogram terminated\n");
                } else {
                    letsWork = NO;
                    printf("answer not valid");
                }
                
            }
            
            
            
            
        }
        
        
        
    }
    return 0;
}
