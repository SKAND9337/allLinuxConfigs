function nturb --wraps='echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo' --description 'alias nturb echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
    echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo $argv
end
