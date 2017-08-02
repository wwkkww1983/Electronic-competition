transcript on
if ![file isdirectory pro_2017_iputf_libs] {
	file mkdir pro_2017_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "E:/2017diansai/2011/2011_program/clk_200_sim/clk_200.vo"

vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/pro_2017.v}
vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/anjian.v}
vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/m_1.v}
vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/m_2.v}
vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/sync.v}
vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/display.v}

vlog -vlog01compat -work work +incdir+E:/2017diansai/2011/2011_program {E:/2017diansai/2011/2011_program/tb_2011.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_2011

add wave *
view structure
view signals
run -all
