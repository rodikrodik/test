extends Node2D

@onready var girl = $"../GirlCharacter"


func _on_smug_pressed() -> void:
	girl.change_emote("Smug")

func _on_annoyed_pressed() -> void:
	girl.change_emote("Annoyed")

func _on_angry_pressed() -> void:
	girl.change_emote("Angry")
