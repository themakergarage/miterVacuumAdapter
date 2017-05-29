/*  miterVacuumAdapter OpenSCAD File
    Copyright (C) 2017 The Maker Garage

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
*/

/*
    This file generates an adapter that allows a miter saw dust port to be connected with a shop-vac.  It was specifically designed for the Ryobi 12” Sliding Compound Miter Saw with Laser TSS120L and the Shop-Vac 90M300.  It may work with other saws and shop-vacs.  The dimensions listed below can be modified for use with another miter saw/shop-vac combo.  Due to the variance in printer calibration and quality, some tweaking of the parameters and/or the print may be required to be able to print the item.
*/


miterDiameter = 37.75;
miterDepth = 20.5;
vacuumDiameter = 31.88;
vacuumDepth = 51;
transitionLength = 40;
wallThickness = 2;

union(){
    difference(){
        cylinder(h=miterDepth, d=(miterDiameter+(2*wallThickness)));
        cylinder(h=miterDepth, d=miterDiameter);
    }
    //Better!
    translate([0, 0, (miterDepth+transitionLength)])
    difference(){
        cylinder(h=vacuumDepth, d=(vacuumDiameter+(2*wallThickness)));
        cylinder(h=vacuumDepth, d=vacuumDiameter);
    }
    translate([0, 0, miterDepth])
    difference(){
        cylinder(h=transitionLength, d1=(miterDiameter+(2*wallThickness)), d2=(vacuumDiameter+(2*wallThickness)));
        cylinder(h=transitionLength, d1=miterDiameter, d2=vacuumDiameter);
    }
}