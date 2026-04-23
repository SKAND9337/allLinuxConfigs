function lanCONNECT --wraps='nmcli device connect eno1' --description 'alias lanCONNECT nmcli device connect eno1'
    nmcli device connect eno1 $argv
end
