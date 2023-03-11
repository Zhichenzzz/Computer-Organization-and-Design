onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib I_mem1_opt

do {wave.do}

view wave
view structure
view signals

do {I_mem1.udo}

run -all

quit -force
