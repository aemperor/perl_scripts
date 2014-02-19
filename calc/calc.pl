#!/usr/bin/perl

#Alexis Emperador
#ase369
#CS105

while (<>){
  push /[a-z](?:[a-z']*[a-z])?/ig, @stack; #creating stack
}

foreach $exp (@stack){
  #create a new stack with everything backwards so operations are below
  push $exp, @opstack;
}

foreach $opexp (@opstack){
  if ($opexp =~ /^[+-]?\d+$/){
    push $opexp, @numstack;
  }
  else{
    push $opexp, @ops;
  }
}

while (defined(@numstack) && defined(@ops)){
  $a = pop @numstack;
  $b = pop @numstack;
  $op = pop @ops;
  
    

}
