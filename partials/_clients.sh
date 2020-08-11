# Iridium Digital Solutions
alias elyon='ssh -o "FingerprintHash md5" -p 25122 -i ~/.ssh/id_rsa travis8@45.79.141.45'
alias littlelion='ssh -o "FingerprintHash md5" -p 25122 -i ~/.ssh/travis8 travis8@198.74.56.88'
alias idm2='ssh -o "FingerprintHash md5" -tt -p 25122 -i ~/.ssh/id_rsa travis8@45.79.141.45 ssh -i /home/travis8/.ssh/travis8 travis8@idm2.vividiridium.com' # goes through elyon server first.
