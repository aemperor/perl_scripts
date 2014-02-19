#! /usr/bin/perl
use Email::Valid


while (<>){
  chomp;
  if (Email::Valid->address($email_address)) {
    push @listofemails, $_; 
  }
}

#create a hash of emails
for (@listofemails){
  print "I am in list of emails: $_ \n";
  $emailfreqs{($_)}++;
}

$numemails = scalar (keys %emailfreqs);
print "Total distinct addresses found: $numemails \n";

#get words in descending order
for (sort {$emailfreqs{$a} <= $emailfreqs{$b}} keys %emailfreqs){
  last if($#descending == $numemails-1);
  push @descendwords, $_;
}

#print out the words in descending order
for (@descendwords){
  print "$_: $emailfreqs{$_} \n";
}
