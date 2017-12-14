function circle(radius, split_number, base_height)
pts={}
for i=1.0, split_number, 1.0
do
    parameter=2 * math.pi * i/split_number
    x = radius * math.cos(parameter)
    y = radius * math.sin(parameter)
    pts[i]=v(x,y,base_height)
end
return pts
end

screw_head=linear_extrude( v(0,0,2.5) , circle(3.2,6,0))

c00=translate(-70,11.5,11.5)*rotate(0,90,0)*cylinder(1.5,30)
c01=translate(-70,11.5,-11.5)*rotate(0,90,0)*cylinder(1.5,30)
c10=translate(-70,-11.5,-11.5)*rotate(0,90,0)*cylinder(1.5,30)
c11=translate(-70,-11.5,11.5)*rotate(0,90,0)*cylinder(1.5,30)

base_cube=translate(-17.5,0,-17)*(D(D(translate(-5,0,0)*cube(50),cube(50)),translate(-10,0,35)*cube(50)))

c20=translate(-50,15.25,0)*rotate(0,90,0)*cylinder(1.5,10)

c21=translate(-50,-15.25,0)*rotate(0,90,0)*cylinder(1.5,10)


base_cube=D(base_cube,c00)
base_cube=D(base_cube,c10)
base_cube=D(base_cube,c01)
base_cube=D(base_cube,c11)
base_cube=D(base_cube,c20)
base_cube=D(base_cube,c21)


hide=translate(-47.5,0,0)*rotate(0,90,0)*cylinder(3,2.5)



hide1=translate(0,15.25,0)*hide
hide2=translate(0,-15.25,0)*hide

base_cube=D(base_cube,hide1)
base_cube=D(base_cube,hide2)

hide=translate(2.5,0,0)*hide

hide3=translate(11.5,11.5,-45)*screw_head
hide4=translate(-11.5,11.5,-45)*screw_head
hide5=translate(11.5,-11.5,-45)*screw_head
hide6=translate(-11.5,-11.5,-45)*screw_head

base_cube=rotate(0,-90,0)*base_cube
base_cube=D(base_cube,hide3)
base_cube=D(base_cube,hide4)
base_cube=D(base_cube,hide5)
base_cube=D(base_cube,hide6)
emit(D(base_cube,hide3))





