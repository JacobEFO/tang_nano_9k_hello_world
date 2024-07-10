# Project related variables
project := hello_world

# Design related variables
top_file := counter.v
top_module := top
constraints_file := constraints.cst
device := GW1NR-LV9QN88PC6/I5
device_family := GW1N-9C
board := tangnano

# Build flow related variables
output_synth := synth-$(project).json
output_pnr := pnr-$(project).json
output_bitstream := bitstream-$(project).fs
build_dir := ./build


synth: 
	yosys $(top_file) -p'synth_gowin -top $(top_module) -json $(build_dir)/$(output_synth)'

pnr:
	nextpnr-himbaechel  --json $(build_dir)/$(output_synth) \
						--write $(build_dir)/$(output_pnr) \
						--device '$(device)' \
						--vopt cst=$(constraints_file) \
						--vopt family=$(device_family)

bitstream:
	gowin_pack -d $(device_family) -o $(build_dir)/$(output_bitstream) $(build_dir)/$(output_pnr)

program:
	openFPGALoader -b $(board) $(build_dir)/$(output_bitstream)

clean:
	rm -rf $(build_dir)/*
