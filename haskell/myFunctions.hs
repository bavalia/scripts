
-- functions
-- to load ==>  :l myFunctions

sumOfTwice x y = twice x + twice (twice y) -- functions

twice x = x+x  -- 2 times of anything

twiceIfSmall x = if x<100  -- 'if' statement in haskell is expression, which always returns something
    then twice x           -- returns twice x
    else x                 -- returns x, 'else' is always compulsury as function has to return something

length' xs = sum [ 1| _ <- xs]


-- chapter functions

numToWord :: (Integral a) => a -> String
numToWord 1 = "one"
numToWord 2 = "two"
numToWord 3 = "three"
numToWord 4 = "four"
numToWord 5 = "five"
numToWord x = "not in one to five" -- first matched pattern used, so x is last

--differ :: (Num a) => a -> String -- not working keep reading
--differ x = "Integral"
--differ :: (Char a) => a -> String
--differ x = "not Integral"

vecDot :: (Num a) => (a,a) -> (a,a) -> a
vecDot (x1, y1) (x2, y2) = x1*x2 + y1*y2

vecAdd :: (Num a) => (a,a) -> (a,a) -> (a,a)
--vecAdd (x1,y1) (x2,y2) = (x1+x2, y1+y2)
vecAdd v1 v2 = v1v2
    where
        (x1,y1) = v1  -- order of defining is reverse in pattern matching
        (x2,y2) = v2
        v1v2 = (x1+x2, y1+y2) -- order of defining is as usual in expression

secIn3 :: (a,b,c) -> b
secIn3 (_,b,_) = b

head' :: [a] -> a
head' [] = error "error"
head' (a:_) = a

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

realFloat :: (Floating a, Ord a) => a -> String -- Foating type is not comparable
realFloat a = if a>0 then ">0" else "<0" -- comparision requires Ord, Floating+Ord=RealFloat


max' :: (Ord a) => a -> a -> a
max' a b 
    | a>b = a
    | otherwise = b 

fib1 = (map fib' [0 ..] !!)  -- considerably faster than fib2
    where                    -- https://wiki.haskell.org/Let_vs._Where
      fib' 0 = 0
      fib' 1 = 1
      fib' n = fib1 (n - 1) + fib1 (n - 2)


fib2 x = map fib' [0 ..] !! x -- very slow compared to fib1
    where
      fib' 0 = 0
      fib' 1 = 1
      fib' n = fib2 (n - 1) + fib2 (n - 2)

fib3 :: (Integral a) => a -> a -- slower than fib2, slowest among this
fib3 x = case x of
            0 -> 0
            1 -> 1
            otherwise -> fib3 (x-1) + fib3 (x-2)
--fib3 0 = 0
--fib3 1 = 1
--fib3 x = fib3 (x-1) + fib3 (x-2)

bmiInterpretation :: (RealFloat a, Show a) => a -> a -> String
bmiInterpretation weight height
    | bmi<18.5 = showBmi ++ "You are too skinny, Increase weight."
    | bmi<25.0 = showBmi ++ "You are normal, Congratulation !!"
    | bmi<30.0 = showBmi ++ "You are fat, Reduce weight."
    | otherwise= showBmi ++ "Now you are officially an Elephant !!"
    where
        bmi = weight / height^2
        showBmi = "BMI = " ++ show bmi ++ " "

cylinderArea :: (RealFloat a) => a -> a -> a
cylinderArea radius height = 
    let sideArea = 2 * pi * radius * height
        topArea = pi * radius^2
    in  sideArea + 2 * topArea

healthyBmis :: (RealFloat a) => [(a,a)]->[a]
healthyBmis xs = [ bmi | (w,h) <- xs, let bmi = w/h^2, bmi<25, bmi>18.5]


removeDuplicate :: (Eq a) => [a] -> [a]
removeDuplicate [] = []
--removeDuplicate x:[] = x:[]
removeDuplicate (x:xs) = if (elem x xs)
                            then removeDuplicate xs
                            else x: removeDuplicate xs



-- Option 2
prime1 = (map prime' [0 ..] !! ) -- much faster, still not enough
    where                        -- saves primes to memory as it calculates.
        prime' 0 = 1
        prime' 1 = 2
        prime' 2 = 3
        prime' n = head [y|y<-(let start = (prime1 (n-1)) in [start+2, start+4 ..]), head ([False| z<- (takeWhile (\c -> fromIntegral c < sqrt(fromIntegral(prime1 (n-1))+100)) (map prime1 [1.. n-1])), (mod y z) ==0]++[True])]



--prime1 = (map prime' [0 ..] !! ) -- much faster, still not enough
--    where                        -- saves primes to memory as it calculates.
--        prime' 0 = 1
--        prime' 1 = 2
--        prime' 2 = 3
--        prime' n = head [y|y<-(let start = (prime1 (n-1)) in [start+2, start+4 ..]), head ([False| z<-[1.. range], (mod y (prime1 z)) ==0]++[True])]
--            where
--                range = head[a|a<-[1..], fromIntegral(prime1 a) > sqrt(fromIntegral (prime1 (n-1)))]


primeN :: (Integral a) => a -> a  -- too slow, 20 is too much
primeN 1 = 2
primeN 2 = 3
primeN x = head [y| y<-[primeN (x-1) +2 ..], not(foldr (||) False [True|z<-[1.. (x-1)], (mod y (primeN z)) == 0]) ]


factor :: (Integral a) => a -> [a]
factor 1 = []
factor x = fact:factor (quot x fact)
    where fact = head [y|y<-[2 .. (quot x 2)]++[x], mod x y ==0]

--LCM :: (Integral a) => a -> a -> a



