// *********************************************************************************************************************
// ( )/ )(_  _)(_  _)___(  _ \(  _  )(  _ \(  _  )(_  _)(_  _)/ __)/ __)
//  )  (  _)(_   )( (___))   / )(_)(  ) _ < )(_)(   )(   _)(_( (__ \__ \
// (_)\_)(____) (__)    (_)\_)(_____)(____/(_____) (__) (____)\___)(___/
// *********************************************************************************************************************
// Written by bcantin@kitchissippi-robotics.com
// Copyright (c) 2015-2016 Kitchissippi Robotics
// ---------------------------------------------------------------------------------------------------------------------
// Common Hardware
// *********************************************************************************************************************

// ---------------------------------------------------------------------------------------------------------------------
// Global Constants - Do Not Overwrite
// .....................................................................................................................

// just dummy values - these need to be fixed, I gots a plan in mind. #BC
gRender_ScreenQuality 		= 15;		// used for onscreen rendering to reduce processing time in OpenSCAD
gRender_DraftQuality 		= 50;		// used for test parts that might be printed but time to create them is lower
gRender_ProductionQuality 	= 100;		// used for final quality prints, these should be nice but take a very long time
										// to compile

// ---------------------------------------------------------------------------------------------------------------------
// Global Indexes - Do Not Overwrite
// .....................................................................................................................
// To make parametric items easier to work with, their values are stored in an array which can be indexed by the 
// scripting functions and allow for defining hardware items with a single variable.

// Vector for sizing bolts: [HeadDiameter, HeadHeight, ShaftDiameter]
iBolt_HeadDiameter 	= 0;	// diameter of the bolt head
iBolt_HeadHeight 	= 1;	// height of the bolt head
iBolt_ShaftDiameter = 2;	// shaft diameter of the bolt

// Vector for sizing nuts: 	[NutDiameter, NutThickness, NutFaces]
iNut_Diameter 		= 0;	// diameter of the widest part of the nut
iNut_Thickness 		= 1;	// thickness of the nut
iNut_Faces 			= 2;	// number edges/faces to the nut

// ---------------------------------------------------------------------------------------------------------------------
// Initialize globals
// .....................................................................................................................
// Call this at the top of all scripts that use the hardware library - it sets up some key rendering defaults
// .....................................................................................................................
// - nozzleSize 	: pass the size of the nozzle used on the printer for some fine-tuning of filament compensations
// - renderQuality 	: pass the render quality to be used, defaults to screen

module Hardware_Initialize(nozzleSize = 0.4, renderQuality = gRender_ScreenQuality) {

}

// ---------------------------------------------------------------------------------------------------------------------
// Include the various HW sub components

include <HW_Bolts.scad>





