Based on David Zhang's work, check it out here: https://github.com/davidz-yt/desk-controller/tree/main

While David's setup involves an OLED TV for his monitor, my setup is different. I rely on a Samsung Odyssey G9 49", which lacks smart capabilities altogether. However, after some research, I stumbled upon MQTT-MGMT by Moimart, available at here: https://github.com/moimart/ddc-mqtt

Which enables you to utilize a Linux device connected via HDMI to any monitor to read the hexadecimal registers for the menu via ddcutil. The repo allows you to create MQTT device that integrates seamlessly with Home Assistant, once you have identified the values that change the desired inputs. I used a Pi Zero 2 W running Ubuntu Server that I have placed inside the back of the monitor. What does this mean? Essentially, you can create an MQTT KVM device within HA that you can now push requests to, basically adding smart capabilties to your Samsung Odyssey G9 49" or any monitor.

### Additional Hardware (Not Mentioned in David's version):
- **EPOMAKER EK21 VIA Gasket Number Pad:** Can be found on Amazon, relatively cheap, and is 2.4GHz compatible.
- **Pi Zero 2 W:** Used for the DDC-MGMT, placed inside the Samsung Odyssey G9.
- **PNGKNYOCN Mini HDMI to HDMI Cable 15cm 90 Degree High-Speed 4K Mini HDMI Male to HDMI Male:** Used for connecting the Pi Zero 2 W to the Samsung Odyssey G9.
