// *********************************************************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *********************************************************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2015-2016 Kitchissippi Robotics
// ---------------------------------------------------------------------------------------------------------------------
// Bolt_Hardware.scad
// *********************************************************************************************************************

// ---------------------------------------------------------------------------------------------------------------------
// Vector Indexes
// .....................................................................................................................
// To make parametric items easier to work with, their values are stored in an array which can be indexed by the
// scripting functions and allow for defining hardware items with a single variable.
// .....................................................................................................................

// Vector for sizing bolts: [HeadDiameter, HeadHeight, ShaftDiameter]
iBolt_HeadDiameter 	= 0;	// diameter of the bolt head
iBolt_HeadHeight 	= 1;	// height of the bolt head
iBolt_ShaftDiameter = 2;	// shaft diameter of the bolt
iBolt_HeadStyle 	= 3;

// Vector for sizing nuts: 	[NutDiameter, NutThickness, NutFaces]
iNut_Diameter 		= 0;	// diameter of the widest part of the nut
iNut_Thickness 		= 1;	// thickness of the nut
iNut_Faces 			= 2;	// number edges/faces to the nut

// Indexing for Head Styles
iBoltHead_Allen 	= 0;
iBoltHead_Hex 		= 1;
iBoltHead_Pan 		= 2;

// ---------------------------------------------------------------------------------------------------------------------
// Facet Sizes
// .....................................................................................................................

if (undef == RENDER_LEVEL) {
	RENDER_LEVEL = 1;
}

gcFacetSmall 		= 16 * RENDER_LEVEL;
gcFacetMedium 		= 24 * RENDER_LEVEL;
gcFacetLarge 		= 32 * RENDER_LEVEL;

// *********************************************************************************************************************

// ---------------------------------------------------------------------------------------------------------------------
// Metric Bolt Hardware - Allen Key head
// .....................................................................................................................

hwM3_Bolt_AllenHead = [5.4, 2.8, 3, iBoltHead_Allen];	// [HeadDiameter, HeadHeight, ShaftDiameter]
hwM4_Bolt_AllenHead = [6.8, 4.3, 4, iBoltHead_Allen]; 	// [HeadDiameter, HeadHeight, ShaftDiameter]

// ---------------------------------------------------------------------------------------------------------------------
// Metric Bolt Hardware - Hex Wrench head
// .....................................................................................................................

// Hex Wrench style head
hwM4_Bolt_HexHeadDiameter = 7.8;
hwM4_Bolt_HexHeadHeight = 2.8;

// ---------------------------------------------------------------------------------------------------------------------
// SAE Bolt Hardware - Pan head
// .....................................................................................................................

hwNo8_Bolt_PanHead 	= [7, 	3.25, 	4.166, iBoltHead_Pan];		// Measured from actual bolt
hwNo10_Bolt_PanHead = [8.5, 3.25, 	4.826, iBoltHead_Pan];		// Measured from actual bolt

// *********************************************************************************************************************

include <FFM_Functions.scad>

// ---------------------------------------------------------------------------------------------------------------------
// Draw Bolt
// .....................................................................................................................

module Draw_hwBolt(_boltSize, _boltLength) {
	% union() {
		// bolt shaft
		cylinder(h = _boltLength, d = _boltSize[iBolt_ShaftDiameter], $fn=gcFacetSmall, center = false);

		// bolt head Allen Key type
		if (_boltSize[iBolt_HeadStyle] == iBoltHead_Allen) {
			difference() {
				translate([0,0,_boltLength])
					cylinder(h = _boltSize[iBolt_HeadHeight], d = _boltSize[iBolt_HeadDiameter], $fn=gcFacetSmall, center = false);
				translate([0,0,_boltLength  + 1])
					cylinder(h = _boltSize[iBolt_HeadHeight], d = _boltSize[iBolt_HeadDiameter] / 2, $fn=5, center = false);
			}
		} else if (_boltSize[iBolt_HeadStyle] == iBoltHead_Pan) {
			hull() {
				translate([0,0,_boltLength])
						cylinder(h = _boltSize[iBolt_HeadHeight] / 3, d = _boltSize[iBolt_HeadDiameter], $fn=gcFacetSmall, center = false);
				translate([0,0,_boltLength])
						cylinder(h = _boltSize[iBolt_HeadHeight], d = _boltSize[iBolt_ShaftDiameter], $fn=gcFacetSmall, center = false);
			}
		}
	}
}

// ---------------------------------------------------------------------------------------------------------------------
// Carve Bolt Hole
// .....................................................................................................................

module Carve_hwBolt(_boltSize, _boltLength, _headClearance = 0) {
	// hole for bolt shaft
	cylinder(h = _boltLength, d = HW_Hole(_boltSize[iBolt_ShaftDiameter]), $fn=gcFacetSmall, center = false);
	translate([0,0,_boltLength])
		cylinder(h = HW_Hole(_boltSize[iBolt_HeadHeight]) + _headClearance, d = HW_Hole(_boltSize[iBolt_HeadDiameter]), $fn=gcFacetSmall, center = false);
}
