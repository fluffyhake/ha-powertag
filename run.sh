#!/bin/bash

ls -all


./powertagd -d /dev/ttyACM1 | ./powertag2mqtt -username mqtt-user -password mqtt-password
