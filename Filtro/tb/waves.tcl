base -open waves -into waves.shm -default
probe -create -shm dut.* -waveform
reset
run
