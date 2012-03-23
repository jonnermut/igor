#import "ClassPattern.h"
#import "NodeMatcher.h"
#import "NodePattern.h"
#import "PredicatePattern.h"
#import "PredicateMatcher.h"

@implementation NodePattern

+ (NodePattern *)forScanner:(NSScanner *)scanner {
    return (NodePattern *)[[self alloc] initWithScanner:scanner];
}

- (NodeMatcher *)parse {
    ClassMatcher *classMatcher = [[ClassPattern forScanner:self.scanner] parse];
    PredicateMatcher *predicateMatcher = [[PredicatePattern new] parse:self.scanner];
    return [NodeMatcher withClassMatcher:classMatcher predicateMatcher:predicateMatcher];
}

@end
