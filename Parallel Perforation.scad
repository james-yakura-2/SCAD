difference()
{
    translate([0,0,1])
    cylinder(r1=100, r2=100, h=18);
    
    parallel_perforation(10, 10, 3, 3, 20, 3);
}

//Creates rings of parallel cylinders. The cylinders are arranged in rings, a certain distance apart. Within any given ring, no two cylinders are closer than a certain distance around the ring.
module parallel_perforation(min_distance, rings, ring_width, hole_separation, hole_length, hole_radius)
{    
    if(min_distance==0)
    {
        cylinder(r1=hole_radius, r2=hole_radius, h=hole_length);
    }
    for(ring=[1:rings-1])
    {
        //Calculate the ring's circumference.
        ring_radius=ring*(hole_radius*2+ring_width)+min_distance;
        circumference=ring_radius*2*3.1415926535;
        holes=ceil(circumference/(hole_radius*2+hole_separation));
        increment=360/holes;
        ring_offset=rands(0,increment,1)[0];
        for(hole=[0:holes-1])
        {
            rotate([0,0,increment*hole+ring_offset])
            translate([ring_radius,0,0])
            cylinder(r1=hole_radius, r2=hole_radius, h=hole_length);
        }
    }
}