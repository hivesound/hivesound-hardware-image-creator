# pass the certificate filepath as argument
sed ':a;N;$!ba;s/\n/\\n/g' $1 > $1_oneliner