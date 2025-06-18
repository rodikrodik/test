extends Control

@onready var menu = $MarginContainer
@onready var customization = $MarginContainer2
@onready var actions = $MarginContainer3
@onready var girl = $"../GirlCharacter"
@onready var game = $".."

func toggle_visibility(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true
		
func _on_clothes_pressed() -> void:
	toggle_visibility(customization)
	toggle_visibility(menu)
	
func _on_exit_pressed() -> void:
	toggle_visibility(customization)
	toggle_visibility(menu)

func _on_actions_pressed() -> void:
	toggle_visibility(actions)
	toggle_visibility(menu)
	
func _on_exit_2_pressed() -> void:
	toggle_visibility(actions)
	toggle_visibility(menu)

func _on_hoodie_pressed() -> void:
	girl.change_cloth("Hoodie")


func _on_pajama_pressed() -> void:
	girl.change_cloth("Pajama")


func _on_uniform_pressed() -> void:
	girl.change_cloth("Uniform")


func _on_seifuku_pressed() -> void:
	girl.change_cloth("Seifuku1")


func _on_swimsuit_pressed() -> void:
	girl.change_cloth("Swimsuit")


func _on_blondie_pressed() -> void:
	girl.change_hair("Blondie")


func _on_brown_pressed() -> void:
	girl.change_hair("Brown")


func _on_pink_pressed() -> void:
	girl.change_hair("Pink")


func _on_dark_pressed() -> void:
	girl.change_hair("Dark")


func _on_silver_pressed() -> void:
	girl.change_hair("Silver")


func _on_black_glasses_pressed() -> void:
	girl.change_accessory("BlackGlasses")


func _on_choker_pressed() -> void:
	girl.change_accessory("Choker")
	



func _on_cirlce_glasses_pressed() -> void:
	girl.change_accessory("CircleGlasses")


func _on_flower_pressed() -> void:
	girl.change_accessory("Flower")


func _on_red_glasses_pressed() -> void:
	girl.change_accessory("RedGlasses")


func _on_button_pressed() -> void:
	game.hunger += 10


func _on_button_2_pressed() -> void:
	game.energy += 10
