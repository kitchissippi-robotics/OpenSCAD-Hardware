# OpenSCAD-Hardware
An OpenSCAD Library of Functions related to various assembly hardware with compensation for 3D Printing tolerances

Written by bcantin@kitchissippi-robotics.com<br>
Copyright &copy; Kitchissippi Robotics 2016

## Preamble

*Necessity is the mother of invention*<br>
_- Unknown_


All mechanical engineering projects need some hardware to assembled them, and all good programmers know that when you need to do something more than once, you make it a function.<br>
This project aims to build a library of common assembly hardware and collect related functions into a single source base.<br>
This is geared towards performing mathematical compensation within OpenSCAD for 3D printing usage and simplify variable specifications.

## Usage

Include the library with `include <Hardware.scad>`<br>
Initialize the library with `Hardware(nozzleSize, renderQuality);`


## Revision Notes

v0.1.0 - Initial Design