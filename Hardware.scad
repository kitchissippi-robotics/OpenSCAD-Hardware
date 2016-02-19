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

// just dummy values - these need to be fixed, I gots a plan in mind. #BC
gScreenQuality 		= 15;		// used for onscreen rendering to reduce processing time in OpenSCAD
gDraftQuality 		= 50;			// used for test parts that might be printed but time to create them is lower
gProductionQuality = 100;	// used for final quality prints, these should be nice but take a very long time to compile

// ---------------------------------------------------------------------------------------------------------------------
// Global Indexes - Do Not Overwrite

// Vector for Sizing Bolts: [HeadDiameter, HeadHeight, ShaftDiameter]
iBolt_HeadDiameter 	= 0;
iBolt_HeadHeight 	= 1;
iBolt_ShaftDiameter = 2;

// ---------------------------------------------------------------------------------------------------------------------
// Initialize globals
// - nozzleSize 	: pass the size of the nozzle used on the printer for some fine-tuning of filament compensations
// - renderQuality 	: pass the render quality to be used, defaults to screen

module Hardware_Initialize(nozzleSize = 0.4, renderQuality = gScreenQuality) {

}

// ---------------------------------------------------------------------------------------------------------------------
// Include the various HW sub components

include <HW_Bolts.scad>





