extends Control

@onready var energy_label = $EnergyLabel
@onready var hunger_label = $HungerLabel

func update_stats(energy: int, hunger: int):
	energy_label.text = "Бодрость: %d / 100" % energy
	hunger_label.text = "Сытость: %d / 100" % hunger
