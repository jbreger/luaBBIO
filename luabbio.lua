
HIGH="HIGH"
LOW="LOW"
OUTPUT="OUTPUT"
INPUT="INPUT"
pinList={} --needed for unexport
startTime=os.clock() --needed for milliseconds

--Refer to pages 55,57,60,62 in Beagle Bone reference manual
digitalPinsdef={
--pin is pin p_number refers to pin numbers
["P8.3"]=38,
["P8.4"]=39,
["P8.5"]=34,
["P8.6"]=35,
["P8.11"]=45,
["P8.12"]=44,
["P8.14"]=26,
["P8.15"]=47,
["P8.16"]=46,
["P8.17"]=27,
["P8.18"]=65,
["P8.20"]=63,
["P8.21"]=62,
["P8.22"]=37,
["P8.23"]=36,
["P8.24"]=33,
["P8.25"]=32,
["P8.26"]=61,
["P8.27"]=86,
["P8.28"]=88,
["P8.29"]=87,
["P8.30"]=89,
["P8.39"]=76,
["P8.40"]=77,
["P8.41"]=74,
["P8.42"]=75,
["P8.43"]=72,
["P8.44"]=73,
["P8.45"]=70,
["P8.46"]=71,
["P9.12"]=60,
["P9.15"]=48,
["P9.23"]=117,
["P9.27"]=115,
["P9.42"]=7,
}


--pin is pin mux_value refers to mux values
pinMuxDef = {
["P8.3"]="gpmc_ad6",
["P8.4"]="gpmc_ad7",
["P8.5"]="gpmc_ad2",
["P8.6"]="gpmc_ad3",
["P8.7"]="gpmc_advn_ale",
["P8.8"]="gpmc_oen_ren",
["P8.9"]="gpmc_ben0_cle",
["P8.10"]="gpmc_wen",
["P8.11"]="gpmc_ad13",
["P8.12"]="gpmc_ad12",
["P8.13"]="gpmc_ad9",
["P8.14"]="gpmc_ad10",
["P8.15"]="gpmc_ad15",
["P8.16"]="gpmc_ad14",
["P8.17"]="gpmc_ad11",
["P8.18"]="gpmc_clk",
["P8.19"]="gpmc_ad8",
["P8.20"]="gpmc_csn2",
["P8.21"]="gpmc_csn1",
["P8.22"]="gpmc_ad5",
["P8.23"]="gpmc_ad4",
["P8.24"]="gpmc_ad1",
["P8.13"]="gpmc_ad9",
["P8.25"]="gpmc_ad0",
["P8.26"]="gpmc_csn0",
["P8.27"]="lcd_vsync",
["P8.28"]="lcd_pclk",
["P8.29"]="lcd_hsync",
["P8.30"]="lcd_ac_bias_en",
["P8.31"]="lcd_data14",
["P8.32"]="lcd_data15",
["P8.33"]="lcd_data13",
["P8.34"]="lcd_data11",
["P8.35"]="lcd_data12",
["P8.36"]="lcd_data10",
["P8.37"]="lcd_data8",
["P8.38"]="lcd_data9",
["P8.39"]="lcd_data6",
["P8.40"]="lcd_data7",
["P8.41"]="lcd_data4",
["P8.42"]="lcd_data5",
["P8.43"]="lcd_data2",
["P8.44"]="lcd_data3",
["P8.45"]="lcd_data0",
["P8.46"]="lcd_data1",
["P9.11"]="gpmc_wait0",
["P9.12"]="gpmc_ben1",
["P9.13"]="gpmc_wpn",
["P9.14"]="gpmc_a2",
["P9.15"]="gpmc_a0",
["P9.16"]="gomc_a3",
["P9.17"]="spio=0_cs0",
["P9.18"]="spi0_d1",
["P9.19"]="uart1_rtsn",
["P9.20"]="uart1_ctsn",
["P9.21"]="spi0_d0",
["P9.22"]="spi0_sclk",
["P9.23"]="gpmc_a1",
["P9.24"]="uart1_txd",
["P9.25"]="mcasp0_ahclkx",
["P9.26"]="uart1_rxd",
["P9.27"]="mcasp0_fsr",
["P9.28"]="mcasp0_ahclkr",
["P9.29"]="mcasp0_fsx",
["P9.30"]="mcasp0_aaxr0",
["P9.41"]="xdma_event_intr0",
["P9.42"]="ecap0_in_pwm0_out",
}

--pin is pin number av is analog value
analogPinDef={
	["P9.33"]="ain4",
	["P9.35"]="ain6",
	["P9.36"]="ain5",
	["P9.37"]="ain2",
	["P9.38"]="ain3",
	["P9.39"]="ain0",
	["P9.40"]="ain1",
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






