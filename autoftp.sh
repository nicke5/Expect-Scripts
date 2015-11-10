#!/usr/bin/expect --
#title          :autoftp.sh
#description    :Expect script to automate connection to an anonymous FTP
#author         :Nick Southorn
#date           :20151110
#version        :1.0
#usage          :./autoftp.sh
#notes          :
#bash_version   :4.1.17(0)-release
#============================================================================
#TODO: Add default or other params
#TODO: Work out how to handle a missing interpreter
#============================================================================


#============================================================================
# VARIABLES
#============================================================================
email=""
destination="shell.sgi.com"

#============================================================================
# FUNCTIONS
#============================================================================
check_expect(){
if ! [ "$(type -t /usr/bin/expect)" ]
then
/usr/bin/clear
cat << EOF

===================================== COMMAND NOT FOUND =====================================

Expect is not installed on this machine. 

It should be installed in /usr/bin/expect before running this program.

===================================== COMMAND NOT FOUND =====================================
EOF
exit
fi
}




#============================================================================
# MAIN
#============================================================================
check_expect
#set timeout -1
spawn ftp $destination 
expect "Name"
send "anonymous\r"
expect "Password:"
send "$email\r"
send "Binary\r"
#expect "ftp>"
interact
