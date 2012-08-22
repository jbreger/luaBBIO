require os.clock()

HIGH="HIGH"
LOW="LOW"
OUTPUT="OUTPUT"
INPUT="INPUT"
pinList={} --needed for unexport
startTime=os.clock() --needed for milliseconds
digitalPinDef={
	"P8.3"=38,
	"P8.4"=39,
	"P8.5"=34,
	"P8.6"=35,
	"P8.11"=45,
	"P8.12"=44,
	"P8.14"=26,
	"P8.15"=47,
	"P8.16"=46,
	"P8.17"=27,
	"P8.18"=65,
	"P8.20"=63,
	"P8.21"=62,
	"P8.22"=37,
	"P8.23"=36,
	"P8.24"=33,
	"P8.25"=32,
	"P8.26"=61,
	"P8.27"=86,
	"P8.28"=88,
	"P8.29"=87,
	"P8.30"=89,
	"P8.39"=76,
	"P8.40"=77,
	"P8.41"=74,
	"P8.42"=75,
	"P8.43"=72,
	"P8.44"=73,
	"P8.45"=70,
	"P8.46"=71,
	"P9.12"=60,
	"P9.15"=48,
	"P9.23"=117,
	"P9.27"=115,
	"P9.42"=7
	}

analogPinDef={
	"P9.33"="ain4",
	"P9.35"="ain6",
	"P9.36"="ain5",
	"P9.37"="ain2",
	"P9.38"="ain3",
	"P9.39"="ain0",
	"P9.40"="ain1"
	}






 run function(setup,main)


end


stop function(){



}
end



bbio_init function(){

	analog_int()

} end



analog_int function(){



}
end


bbio_cleanup function(){




}
end


analog_cleanup function(){




}
end

serial_cleanup function(){






}
end

add_to_cleanup function(routine){


}
end


millis function (){
--return roughly the number of milliseconds since program startTime

return os.time()-startTime


}end


micros function (){
---return the number of milliseconds since program start
return ((os.time()*1000000)-(startTime*1000))
}end
delay function(ms){


}end
delayMicroseconds function(us){


}end

pinmode function(gpio_pin, direction, pull=0){

	if(direction ==INPUT) then
		if(pull>0) then
			pull=CONF_PULLUP
		elseif(pull==0) then
			pull=CONF_PULL_DISABLE
		else
			pull=CONF_PULLDOWN
		end




}end

digitalWrite function(gpio_pin, state){



}end

toggle function(gpio_pin){




}
end

digitalRead function(gpio_pin){




}end

pinState function(gpio_pin){



}end

analogRead function(analog_pin){



}
end




inVolts function(adc_value, bits=12, vRef=1.8){


}end

pinMux function(fn, mode){



}end

andReg function(address, mask, length=32){




}end


orReg function(address, mask, length=32){



}end

xorReg function(address, mask, length=32){




} end


clearReg function(address, mask, length=32){


}end

getReg function(address, length=32){


} end


setReg function(address, new_value, length=32){


}
end




_UART_PORT={}

function _UART_PORT:begin(baud, timeout=1)
	local tx_pinmux_filename
	local this_baud=baud
end



function _UART_PORT:available()

return 1
end








end





