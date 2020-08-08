onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib data_mem_d_IP_opt

do {wave.do}

view wave
view structure
view signals

do {data_mem_d_IP.udo}

run -all

quit -force
