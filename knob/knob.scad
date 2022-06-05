knob_thickness = 5;
knob_radius = 15;
knob_line_width = 1;

shaft_length = 15;
shaft_outer_radius = 3.5;
shaft_thickness = 1;
shaft_fill = 0.4;


module knob()
{
    handle(knob_radius, knob_thickness, knob_line_width);

    translate([0,0,knob_thickness]) {
        shaft(shaft_outer_radius, shaft_length, shaft_thickness, shaft_fill);
    }
}

module handle(radius, height, line_width)
{

    difference() {
        cylinder(r=radius, h=height);
        translate([0,radius/2,0]) {
            cube([line_width, radius, line_width], center=true);
        }
    }

}

module shaft(radius, length, wall_thickness, shaft_fill)
{
    difference() {
        cylinder(r=radius, h=length);
        cylinder(r=radius - wall_thickness, h=length+0.1);
    }

    intersection() {
        cylinder(r=radius, h=length);

        translate([-radius,(shaft_fill - 0.5) * -radius*2,0]) {
            cube([radius*2, radius*2, length]);
        }
    }
}

knob();

// Written by John Meagher <3d@jmeagher.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

                