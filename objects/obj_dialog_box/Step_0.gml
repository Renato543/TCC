text_length = string_length(text_list[text_id]);

if(caractere_id < text_length) { 
	time_to_write++;
	
	if(time_to_write >= 1) { 
		time_to_write = 0;
		caractere_id++;
	}
}

if(keyboard_check_pressed(vk_space)) {
	if(caractere_id < text_length) caractere_id = text_length;
	else {
		caractere_id = 0;
		text_id++;
	}
}

text_id = clamp(text_id, 0, array_length(text_list) - 1);