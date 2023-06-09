onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.I_mem1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {I_mem1.udo}

run -all

quit -force
