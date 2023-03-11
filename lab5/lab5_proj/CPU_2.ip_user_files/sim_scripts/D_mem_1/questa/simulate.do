onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib D_mem_opt

do {wave.do}

view wave
view structure
view signals

do {D_mem.udo}

run -all

quit -force
