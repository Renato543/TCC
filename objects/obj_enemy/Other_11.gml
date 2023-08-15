/// @description Enemy Clumping
// You can write your code in this editor

//collision = function() {
//    var _r = 5 // raio da colisao
//    var _list = ds_list_create()
//    var _bbx = (bbox_left + (bbox_right - bbox_left)/2)
//    var _bby = (bbox_top +  (bbox_bottom - bbox_top)/2)
//    var _num = collision_circle_list(x, _bby-0.5, _r, obj_enemy, 0, 1, _list, false)
    
//    var _mx = 0
//    var _my = 0    
    
//        // soma a posicao de todos pra calcular a média
//    for (var i = 0; i < _num; i++) {
//        var _enemy = _list[| i]
//        _mx += _enemy.x
//        _my += _enemy.y
//    }
    
//	var temp_velh = 0;
//	var temp_velv = 0;
	
//    if (_num) {
//        // pega a posicao média dos outros
//        _mx /= _num
//        _my /= _num
        
//        // gera um vetor na direcao contrária
//        var _dir = (point_direction(_bbx, _bby, _mx, _my)-180)
        
//        // aplica forca na direcao contrária
//        var _force = 1
//        temp_velh +=  dcos(_dir) * _force
//        temp_velv += -dsin(_dir) * _force
        
//                // limita o vetor
//		temp_velh = clamp(temp_velh, -vel, vel)
//		temp_velv = clamp(temp_velv, -vel, vel)
//    }
    
//    ds_list_destroy(_list)
	
//	x += temp_velh;
//	y += temp_velv;
    
//}