onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib inst_mem_rom_IP_opt

do {wave.do}

view wave
view structure
view signals

do {inst_mem_rom_IP.udo}

run -all

quit -force
