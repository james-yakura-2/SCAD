hemisphere(5);

//Creates a hemisphere of the specified radius.
module hemisphere(radius)
{
    difference()
    {
        sphere(r=radius);
        cylinder(r1=radius, r2=radius, h=radius);
    }
}