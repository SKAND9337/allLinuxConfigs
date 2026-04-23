function blueR --wraps='sudo systemctl restart bluetooth' --description 'alias blueR sudo systemctl restart bluetooth'
    sudo systemctl restart bluetooth $argv
end
