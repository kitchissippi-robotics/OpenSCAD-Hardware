module Draw_hw_Bolt_AllenHead(_boltSize, _boltLength) {
	% union() {
		// bolt shaft
		cylinder(h = _boltLength, d = _boltSize[iBolt_ShaftDiameter], $fn=gcFacetSmall, center = false);
		
		// bolt head - Allen Key type
		difference() {
			translate([0,0,_boltLength])
				cylinder(h = _boltSize[iBolt_HeadHeight], d = _boltSize[iBolt_HeadDiameter], $fn=gcFacetSmall, center = false);
			translate([0,0,_boltLength  + 1])
				cylinder(h = _boltSize[iBolt_HeadHeight], d = _boltSize[iBolt_HeadDiameter] / 2, $fn=6, center = false);
		}
	}
}

module Carve_hw_Bolt_AllenHead(_boltSize, _boltLength, _headClearance = 0) {
	// hole for bolt shaft
	cylinder(h = _boltLength, d = _boltSize[iBolt_ShaftDiameter] + gcMachineOffset + gRender_Clearance, $fn=gcFacetSmall, center = false);
	translate([0,0,_boltLength])
		cylinder(h = _boltSize[iBolt_HeadHeight] + _headClearance, d = _boltSize[iBolt_HeadDiameter] + gcMachineOffset + gRender_Clearance , $fn=gcFacetSmall, center = false);
}