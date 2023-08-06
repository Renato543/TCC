if(global.levelling_up) exit;

var _dir = point_direction(other.x, other.y, x, y);

var _force = 1;
x +=  dcos(_dir) * _force;
y += -dsin(_dir) * _force;
