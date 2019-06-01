/*
MIT License

Copyright (c) 1019 Jose D. Saura

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// Designed for this cord:
// https://www.amazon.com/gp/product/B00OVI9XE6/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1


module piston(od)
{
    thread_size = 1.5;
    difference()
    {
        union() {
            piston_height = od*.75;
            
            wall_thickness = 0.05 * od;
            w1 = od/2-0.1; // -0.1 to ensure it rides smoothly
            difference() {
                cylinder(piston_height, w1, w1);
                
                w2 = w1 - wall_thickness;
                translate([0,0,0])
                cylinder(piston_height+1, w2, w2);
            }
        
            cylinder(2*wall_thickness, w1, w1);
            cylinder(10, 2*thread_size, 2*thread_size);
        }
        
        translate([0,0,-.1])
        cylinder(100, thread_size, thread_size);
    }
}



piston(30, $fn=100);