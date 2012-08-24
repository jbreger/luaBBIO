
HIGH="HIGH"
LOW="LOW"
OUTPUT="OUTPUT"
INPUT="INPUT"
pinList={} --needed for unexport
startTime=os.clock() --needed for milliseconds

--Refer to pages 55,57,60,62 in Beagle Bone reference manual
digitalPinsdef={
--pin is pin p_number refers to pin numbers
{pin="P8.3", p_number=38},
{pin="P8.4", p_number=39},
{pin="P8.5", p_number=34},
{pin="P8.6", p_number=35},
{pin="P8.11", p_number=45},
{pin="P8.12", p_number=44},
{pin="P8.14", p_number=26},
{pin="P8.15", p_number=47},
{pin="P8.16", p_number=46},
{pin="P8.17", p_number=27},
{pin="P8.18", p_number=65},
{pin="P8.20", p_number=63},
{pin="P8.21", p_number=62},
{pin="P8.22", p_number=37},
{pin="P8.23", p_number=36},
{pin="P8.24", p_number=33},
{pin="P8.25", p_number=32},
{pin="P8.26", p_number=61},
{pin="P8.27", p_number=86},
{pin="P8.28", p_number=88},
{pin="P8.29", p_number=87},
{pin="P8.30", p_number=89},
{pin="P8.39", p_number=76},
{pin="P8.40", p_number=77},
{pin="P8.41", p_number=74},
{pin="P8.42", p_number=75},
{pin="P8.43", p_number=72},
{pin="P8.44", p_number=73},
{pin="P8.45", p_number=70},
{pin="P8.46", p_number=71},
{pin="P9.12", p_number=60},
{pin="P9.15", p_number=48},
{pin="P9.23", p_number=117},
{pin="P9.27", p_number=115},
{pin="P9.42", p_number=7}
}


--pin is pin mux_value refers to mux values
pinMuxDef = {
{pin="P8.3", mux_value="gpmc_ad6"},
{pin="P8.4", mux_value="gpmc_ad7"},
{pin="P8.5", mux_value="gpmc_ad2"},
{pin="P8.6", mux_value="gpmc_ad3"},
{pin="P8.7", mux_value="gpmc_advn_ale"},
{pin="P8.8", mux_value="gpmc_oen_ren"},
{pin="P8.9", mux_value="gpmc_ben0_cle"},
{pin="P8.10", mux_value="gpmc_wen"},
{pin="P8.11", mux_value="gpmc_ad13"},
{pin="P8.12", mux_value="gpmc_ad12"},
{pin="P8.13", mux_value="gpmc_ad9"},
{pin="P8.14", mux_value="gpmc_ad10"},
{pin="P8.15", mux_value="gpmc_ad15"},
{pin="P8.16", mux_value="gpmc_ad14"},
{pin="P8.17", mux_value="gpmc_ad11"},
{pin="P8.18", mux_value="gpmc_clk"},
{pin="P8.19", mux_value="gpmc_ad8"},
{pin="P8.20", mux_value="gpmc_csn2"},
{pin="P8.21", mux_value="gpmc_csn1"},
{pin="P8.22", mux_value="gpmc_ad5"},
{pin="P8.23", mux_value="gpmc_ad4"},
{pin="P8.24", mux_value="gpmc_ad1"},
{pin="P8.13", mux_value="gpmc_ad9"},
{pin="P8.25", mux_value="gpmc_ad0"},
{pin="P8.26", mux_value="gpmc_csn0"},
{pin="P8.27", mux_value="lcd_vsync"},
{pin="P8.28", mux_value="lcd_pclk"},
{pin="P8.29", mux_value="lcd_hsync"},
{pin="P8.30", mux_value="lcd_ac_bias_en"},
{pin="P8.31", mux_value="lcd_data14"},
{pin="P8.32", mux_value="lcd_data15"},
{pin="P8.33", mux_value="lcd_data13"},
{pin="P8.34", mux_value="lcd_data11"},
{pin="P8.35", mux_value="lcd_data12"},
{pin="P8.36", mux_value="lcd_data10"},
{pin="P8.37", mux_value="lcd_data8"},
{pin="P8.38", mux_value="lcd_data9"},
{pin="P8.39", mux_value="lcd_data6"},
{pin="P8.40", mux_value="lcd_data7"},
{pin="P8.41", mux_value="lcd_data4"},
{pin="P8.42", mux_value="lcd_data5"},
{pin="P8.43", mux_value="lcd_data2"},
{pin="P8.44", mux_value="lcd_data3"},
{pin="P8.45", mux_value="lcd_data0"},
{pin="P8.46", mux_value="lcd_data1"},
{pin="P9.11", mux_value="gpmc_wait0"},
{pin="P9.12", mux_value="gpmc_ben1"},
{pin="P9.13", mux_value="gpmc_wpn"},
{pin="P9.14", mux_value="gpmc_a2"},
{pin="P9.15", mux_value="gpmc_a0"},
{pin="P9.16", mux_value="gomc_a3"},
{pin="P9.17", mux_value="spio=0_cs0"},
{pin="P9.18", mux_value="spi0_d1"},
{pin="P9.19", mux_value="uart1_rtsn"},
{pin="P9.20", mux_value="uart1_ctsn"},
{pin="P9.21", mux_value="spi0_d0"},
{pin="P9.22", mux_value="spi0_sclk"},
{pin="P9.23", mux_value="gpmc_a1"},
{pin="P9.24", mux_value="uart1_txd"},
{pin="P9.25", mux_value="mcasp0_ahclkx"},
{pin="P9.26", mux_value="uart1_rxd"},
{pin="P9.27", mux_value="mcasp0_fsr"},
{pin="P9.28", mux_value="mcasp0_ahclkr"},
{pin="P9.29", mux_value="mcasp0_fsx"},
{pin="P9.30", mux_value="mcasp0_aaxr0"},
{pin="P9.41", mux_value="xdma_event_intr0"},
{pin="P9.42", mux_value="ecap0_in_pwm0_out"},
}

--pin is pin number av is analog value
analogPinDef={
	{pin="P9.33", av="ain4"},
	{pin="P9.35", av="ain6"},
	{pin="P9.36", av="ain5"},
	{pin="P9.37", av="ain2"},
	{pin="P9.38", av="ain3"},
	{pin="P9.39", av="ain0"},
	{pin="P9.40", av="ain1"},
	}
--check pins

function pinMode(pin,directions)
	-- problem with in statement
	if (pin in digitalPinDef) then
		fw=file("/sys/class/gpio/export", "w")
		fw.write("%d" % (digitalPinDef[pin]))
		fw.close()
		local fileName="/sys/class/gpio/gpio%d/direction" % (digitalPinDef[pin])
		fw=file(fileName, "w")
		if direction ==INPUT then
			fw.write("in") --Write in the directions
			muxfile=file("/sys/class/gpio/gpio%d/direction" +(digitalPinDef[pin], "w")
			muxfile.write("2F")
			muxfile.close
		else
			fw.write("out") --write directions
			muxfile=file("/sys/class/gpio/gpio%d/direction" + (digitalPinDef[pin], "w")
			muxfile.write("7")
			muxfile.close
		fw.close()
		pinList.append(digitalPinDef[pin]) --Keep a list of exported pins so that we can unexport them.
		end
	else
		print "pinMode error: pin " + pin + " is not defined as a digital I/O pin in the pin definition."
	end
end
end
end



--check pins

function digitalWrite(pin,status)
	--digitalWrite(pin, status) sets a pin HIGH or LOW
	if digitalPinDef[pin] in pinList
		local fileName="/sys/class/gpio/gpio%d/value" % (digitalPinDef[pin])
		fw=file(fileName, "w") --open the pin's value file for writing
		if status==HIGH then
			fw.write("1") --set the pin to high
		end
		if status==LOW then
			fw.write("0") --Set the pin to low by writing 0 to its value file
		end
		fw.close()
	else:
		print "digitalWrite error: Pin mode for " + pin + " has not been set. Use pinMode(pin, INPUT) first."
end
end
--check pins
function digitalRead(pin)
	--digitalRead(pin) returns HIGH or LOW for a given pin.
	if digitalPinDef[pin] in pinList
		local fileName= "/sys/class/gpio/gpio%d/value" % (digitalPinDef[pin])
		fw = file(fileName, "r")
		inData=fw.read()
		fw.close()
		if inData="0\n" then
			return LOW
		end
		if inData="1\n" then
			return HIGH
		end
	else
		print "digitalRead error: Pin mode for " + pin + " has not been set. Use pinMode(pin, OUTPUT) first."
		return -1
	end
end

--check pins
function analogRead(pin) --analogRead(pin) returns analog value for a given pin.
	if pin in analogPinDef then
		fileName="/sys/devices/platform/tsc/" + (analogPinDef[pin])
		fw = file(fileName, "r")
		data = fw.read()
		fw.close()
		return data
	else
		print "analogRead error: Pin " + pin + " is not defined as an analog in pin in the pin definition."
		return -1
	end

function pinUnexport(pin) --helper function for cleanup()
--check pin functions
	fw=file("/sys/class/gpio/unexport", "w")
	fw.write("%d" % (pin))
	fw.close()
end
--cleanup function needs work
function cleanup(table,val)

--takes care of stepping through pins that were set withpinMode and unExports them. Prints result
--k
	function find_key(dicm val)
		return [k for k, v in dic.iteritems() if v==val][0]
	end
	print ""
	print "Cleaning up. Unexporting the following pins:"
	for pin in pinList
		pinUnexport(pin)
		print fund_key(digitalPinDef, pin)
	end
end

function delay(millis)
	--delay(millis) sleeps the script for a given number of milliseconds
	time.sleep(millis/1000.0)
end
--try function
function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function run(setup, main)
--The main loop; must be passed a setup and a main function.
--First the setup function will be called once, then the main
--function wil be continuously until a stop signal is raised,
--e.g. CTRL-C or a call to the stop() function from within the
--main function.
	try(function() setup() while(true) main() end, function(e) cleanup())

end






