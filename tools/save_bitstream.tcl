# Get current Vivado project directory
set project_root [get_property DIRECTORY [current_project]]

# Destination directory
set save_dir [file join $project_root "saved_bitstreams"]

# Create automatically if necessary
file mkdir $save_dir

# Current implementation run directory
set run_dir [get_property DIRECTORY [current_run]]

# Current top module
set top_name [get_property TOP [get_filesets sources_1]]

# Generated bitstream
set src_bit [file join $run_dir "${top_name}.bit"]

# Destination
set dst_bit [file join $save_dir "${top_name}.bit"]

if {[file exists $src_bit]} {
    file copy -force $src_bit $dst_bit

    puts "========================================"
    puts "Bitstream saved:"
    puts "  $dst_bit"
    puts "========================================"
} else {
    puts "WARNING: Cannot find bitstream:"
    puts "  $src_bit"
}