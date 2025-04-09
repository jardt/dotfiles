#!/bin/bash


pidof $1 && hyprctl dispatch focuswindow class:".*$1" || $1&
