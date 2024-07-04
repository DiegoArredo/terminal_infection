extends Control

@onready var menu = $Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio
@onready var fullscreen = $Video/HBoxContainer/Checks/FullScreen


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world_1.tscn") 


func _on_exit_pressed():
	get_tree().quit()


func _on_online_pressed():
	get_tree().change_scene_to_file("res://Multiplayer/multiplayer_interface.tscn") 


func _on_options_pressed():
	show_and_hide(options,menu)

func show_and_hide(first,second):
	first.show()
	second.hide()

func _on_video_pressed():
	show_and_hide(video,options)


func _on_audio_pressed():
	show_and_hide(audio,options)


func _on_back_to_options_pressed():
	show_and_hide(menu,options)


func _on_back_to_video_pressed():
	show_and_hide(options,video)


func _on_master_value_changed(value):
	volume(0,value)

func volume(bus_index,value):
	AudioServer.set_bus_volume_db(bus_index,value)

func _on_music_value_changed(value):
	volume(1,value)

func _on_sound_fx_value_changed(value):
	volume(2,value)


func _on_back_to_audio_pressed():
	show_and_hide(options,audio)




func _on_full_screen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	


func _on_border_less_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
	else:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
	

func _on_v_sync_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
