function wifiOVERlan --wraps='nmcli device disconnect eno1' --description 'alias wifiOVERlan nmcli device disconnect eno1'
    nmcli device disconnect eno1 $argv
end
