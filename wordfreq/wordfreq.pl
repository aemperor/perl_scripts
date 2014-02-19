#!/usr/bin/perl
#use warnings;

#Alexis Emperador
#ase369
#CS105

while (<>){
  @words_in_line = /[a-z](?:[a-z']*[a-z])?/ig; 
}

#Lower case each word in the array
#Add it to the hash and increment the value as needed
foreach $word (@words_in_line){
  $wordFreq{lc($word)}++;
}

$wordFreqsize = scalar (keys %wordFreq);

print "Total number of distinct words: $wordFreqsize \n";
foreach $word(keys %wordFreq){
  print "$word: $wordFreq{$word} \n";
}

print "Top 10 most frequent words: \n";
for (sort {$wordFreq{$a} <= $wordFreq{$b}} keys %wordFreq){
  last if($#topWords==9);
  push @topWords, $_;
}


for(@topWords){
  print "$_:  $wordFreq{$_} \n";
}

open (DICT, '/usr/share/dict/words');
while (<DICT>){
  chomp;
  $dictword = $_;
  $dictFreq{lc($dictword)}++;
}

foreach $word (keys %wordFreq){
  if($dictFreq{$word} == undef){
    $not_in_dict{$word} = $wordFreq{$word};
  }
}

$notindictsize = scalar (keys %not_in_dict);

print "Total number of distinct words not in the dictionary: $notindictsize \n";
foreach $word (keys %not_in_dict){
  print "$word: $not_in_dict{$word} \n";
}

print "Top 10 most frequent distinct words not in the dictionary: \n";
for (sort {$not_in_dict{$c} <= $not_in_dict{$d}} keys %not_in_dict){
  last if($#topNotDict==9);
  push @topNotDict, $_;
}

for (@topNotDict){
  print "$_: $not_in_dict{$_} \n";
}
