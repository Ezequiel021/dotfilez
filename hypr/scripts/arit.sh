#!/bin/bash
r=255
g=255
b=255

((t = ((r*r + g*g + b*b) > 128*128) * 255))

echo "$t"