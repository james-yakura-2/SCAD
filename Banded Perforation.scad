difference()
{
    translate([0,0,-10])
    cylinder(r1=29, r2=29, h=100);
    
    translate([0,0,-15])
    cylinder(r1=21, r2=21, h=120);
    
    banded_perforation(10, 3, 20, 15, 10, 3);
}
//Creates a series of cylinders, each radiating outward from a central axis.
module banded_perforation(bands, band_distance, min_radius, holes_per_band, hole_length, hole_radius)
{
    for(band=[0:bands-1])
    {
        band_height=band*(hole_radius*2+band_distance);
        increment=360/holes_per_band;
        band_offset=rands(0,increment,1)[0];
        for(hole=[0:holes_per_band])
        {
            translate([0,0,band_height])
            rotate([0,0,hole*increment+band_offset])
            rotate([90,0,0])
            translate([0,0,min_radius])
            cylinder(r1=hole_radius, r2=hole_radius, h=hole_length);
        }
    }    
}