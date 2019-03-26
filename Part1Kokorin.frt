( task 1 parity check )
	: parity 2 % if ." no" cr else ." yes" cr then ;
 ( task 2 prime check )
 : prime ( n )
  dup 0 < if ." Wrong argument " else
    	dup 2 < if drop 0 else
    	dup 2 = if drop 1 else
        dup ( limit for the loop )
        ( n / 2 + 1 )
        dup 2 / 1 + ( current index )
        2 do
           	 r@ % 0
            	= if 
                ( n--answer )
                drop 0
                ( delete current index )
                r> drop 
                (  push limit as the index )
                r@ >r
           else dup then 
        loop
            0 = if 0 else drop 1 then
        then 
    then
then ;
 ( task 3 prime check and write in memory using allot )
 : prime-mem
      prime
       cell% allot dup
        rot swap
    ( writes the result into the memory )
    !
;
( task4 concatenate strings ) 
: concat 
	over count over count 1 + + ( final length ) 
	heap-alloc dup >r 
	dup rot 
	dup count >r 
	dup >r ( save str1 addr ) 
	string-copy 
	r> heap-free ( free str1 )
	r> + swap 
	dup >r ( save str2 addr)
	string-copy 
	r> heap-free ( free str2 )
	r> prints
;
( task5 1307 mod 3 = 2=> find radical ) 
: radical
1 1 >r
repeat
	1 + 
	over over % not  
	if
	 repeat 
		over over / 
		-rot swap drop 
		over over % 	
	until 
		  dup r> * >r
	then
	over 1 =
until	
	drop drop r>
;
