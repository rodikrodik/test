extends Node2D  # или Control

var energy: int = 70
var hunger: int = 70

var energy_decay: int = 1  # уменьшаем на 1 единицу за тик таймера
var hunger_decay: int = 2

@onready var stats_ui = $StatsUI
@onready var girl = $GirlCharacter

func _ready():
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	

func _on_timer_timeout():
	energy -= energy_decay
	hunger -= hunger_decay

	energy = clamp(energy, 0, 100)
	hunger = clamp(hunger, 0, 100)
	saddnes()
	dying()
	stats_ui.update_stats(energy, hunger)
	
func saddnes():
	if energy < 60:
		girl.change_emote("Sad")
	if hunger < 60:
		girl.change_emote("Sad")
	if energy > 60:
		girl.change_emote("Smug")
		if hunger < 60:
			girl.change_emote("Sad")
	if hunger > 60:
		girl.change_emote("Smug")
		if energy < 60:
			girl.change_emote("Sad")
			
func dying():
	if energy == 0:
		get_tree().change_scene_to_file("res://grave.tscn")
	if hunger == 0:
		get_tree().change_scene_to_file("res://grave.tscn")


func _on_skam_pressed() -> void:
	var url = "http://t.me/send?start=IVMX1kqNaCqk"
	OS.shell_open(url)
