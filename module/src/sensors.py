import machine
import VL6180X
import time

SENSOR_ENn = machine.Pin(25, machine.Pin.OUT)

def power_enable():
    SENSOR_ENn.value(0)

def power_disable():
    SENSOR_ENn.value(1)

i2c = machine.I2C(scl=machine.Pin(16), sda=machine.Pin(4), freq=100000)
i2c.scan()

moist_pin = machine.Pin(35, machine.Pin.IN)
moist_adc = machine.ADC(moist_pin) # ADC1 CH 7
moist_adc.atten(machine.ADC.ATTN_11DB)

def moisture():
    """Read the moisture sensor voltage"""
    return 3.3 * moist_adc.read()/1023

battery_pin = machine.Pin(32, machine.Pin.IN)
battery_adc = machine.ADC(battery_pin) # ADC1 CH 4
battery_adc.atten(machine.ADC.ATTN_11DB)

def battery_voltage():
    """Read the total battery voltage"""
    return 3 * 3.3 * battery_adc.read()/1023

luminosity_pin = machine.Pin(33, machine.Pin.IN)
luminosity_adc = machine.ADC(luminosity_pin) # ADC1 CH 5
luminosity_adc.atten(machine.ADC.ATTN_11DB)

def luminosity():
    """Read the luminosity sensor voltage."""
    return 3.3 * luminosity_adc.read()/1023

TOF_ADDR = 41
tof = VL6180X.VL6180X(i2c, TOF_RESETn)
DIST_FULL = 20 # todo: calibrate
DIST_EMPTY = 60

def water_level():
    """Read water level, normalized between 0 and 1."""
    dist = tof.distance()
    level = (dist - DIST_EMPTY)/(DIST_FULL - DIST_EMPTY)
    if level > 1.0:
        level = 1.0
    elif level < 0.0:
        level = 0.0
    return level

TEMP_ADDR = 72

def temperature():
    """Read temperature in deg Celsius."""
    i2c.writeto_mem(TEMP_ADDR, 0x01, b'\x00') # write control register, enable
    temp = i2c.readfrom_mem(TEMP_ADDR, 0x00, 2)
    temp = struct.unpack('>h', temp) # MSByte first -> 16 bit big endian
    (temp, ) = temp # upack tuple
    temp = temp / 256
    return temp

def read_all():
    power_enable()
    time.sleep(0.1)
    addr = i2c.scan()
    # todo: check if all sensor present

    tof.start()

    data = {}
    data['temperature'] = temperature()
    data['luminosity'] = luminosity()
    data['moisture'] = moisture()
    data['battery_voltage'] = battery_voltage()
    data['water_level'] = water_level()

    tof.stop()
    power_disable()

    return data
