rotate([0,0,90])
parabola(40, 10, 1, 10);
multi_parabola (40, 10, 1, 10, 10);
//Creates a filled parabola, using mirrored endpoints.
//d: The distance between the two mirrored endpoints at the base of the parabola.
//roundness: How "rounded" the parabola is.
//h: The height of the parabola's vertex.
//thickness: The thickness of the parabolic section.
module parabola(d, h, roundness, thickness)
{
    r=d*(roundness+1)/2;
    
    distance=sqrt(pow(r,2)-pow((d/2),2));//The distance between the cone's axis and the chord between the two points.
    if(distance!=0)
    {
        run=r-distance; //Assuming a line from the cone's vertex through the parabola's vertex, the horizontal distance underneath the segment between the vertex and the base.
     //The slope of the cone.
        slope=h/run;
        height=r*slope; //The height of the cone.
        section_height=h+thickness*slope+2;
        intersection()
        {
            translate([-distance,0,0])
            cylinder(r1=r, r2=0, h=height);
            
            translate([0,0,section_height/2])
            cube([thickness, d+run*2, section_height], center=true);
        }
    }
    else
    {
        intersection()
        {
            cylinder(r1=d/2, r2=0, h=h);
            
            translate([0,0,h/2+1])
            cube([thickness, d, h+2], center=true);
        }
    }
}

module multi_parabola(d, h, roundness, thickness, resolution)
{
    slice_width=thickness/resolution;
    left_hand=-thickness/2;
    for(i=[0:resolution])
    {
        translate([left_hand+slice_width*i,0,0])
        parabola(d, h, roundness, slice_width+1);
    }
}