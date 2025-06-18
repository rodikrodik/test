extends Node2D

@onready var expression = {
	"Smug" : get_node("BaseBody/Expression/Smug"),
	"Angry" : get_node("BaseBody/Expression/Angry"),
	"Annoyed" : get_node("BaseBody/Expression/Annoyed"),
	"Delighted" : get_node("BaseBody/Expression/Delighted"),
	"Normal" : get_node("BaseBody/Expression/normal"),
	"Sad" : get_node("BaseBody/Expression/Sad"),
	"Shocked" : get_node("BaseBody/Expression/Shocked"),
	"Sleepy" : get_node("BaseBody/Expression/Sleepy"),
	"Smile2" : get_node("BaseBody/Expression/Smile2"),
	"Smile" : get_node("BaseBody/Expression/Smile"),
	"Laugh" : get_node("BaseBody/Expression/Laugh")
}

@onready var accessories = {
	"BlackGlasses" : get_node("BaseBody/Accessory/Glasses/BlackGlasses"),
	"CircleGlasses" : get_node("BaseBody/Accessory/Glasses/CircleGlasses"),
	"RedGlasses" : get_node("BaseBody/Accessory/Glasses/RedGlasses"),
	"Choker" : get_node("BaseBody/Accessory/Choker"),
	"Flower" : get_node("BaseBody/Accessory/Flower")
}

@onready var clothes = {
	"Hoodie" : get_node("BaseBody/Costume/Hoodie"),
	"Pajama" : get_node("BaseBody/Costume/Pajama"),
	"Uniform" : get_node("BaseBody/Costume/Uniform"),
	"Seifuku1" : get_node("BaseBody/Costume/Seifuku1"),
	"Seifuku2" : get_node("BaseBody/Costume/Seifuku2"),
	"Swimsuit" : get_node("BaseBody/Costume/Swimsuit"),
	"SummerDress" : get_node("BaseBody/Costume/SummerDress"),
	"Towel" : get_node("BaseBody/Costume/Towel"),
	"Winteroutfit" : get_node("BaseBody/Costume/Winteroutfit")
}

@onready var blushes = {
	"Blush1" : get_node("BaseBody/Blush/Blush1"),
	"Blush2" : get_node("BaseBody/Blush/Blush2")
}

@onready var hairstyle = {
	"Blondie" : [get_node("BaseBody/Hair/HairFront/Blondie"), get_node("BaseBody/Hair/HairBehind/Blondie")],
	"Brown" : [get_node("BaseBody/Hair/HairFront/Brown"), get_node("BaseBody/Hair/HairBehind/Brown")],
	"Dark" : [get_node("BaseBody/Hair/HairFront/Dark"), get_node("BaseBody/Hair/HairBehind/Dark")],
	"Pink" : [get_node("BaseBody/Hair/HairFront/Pink"), get_node("BaseBody/Hair/HairBehind/Pink")],
	"Silver" : [get_node("BaseBody/Hair/HairFront/Silver"), get_node("BaseBody/Hair/HairBehind/Silver")]
}

@onready var hand = $Hand
var is_holding := false
var move_speed := 150.0
var direction := 1  # 1 = вправо, -1 = влево
var x_min := -200    # левая граница (настрой под себя)
var x_max := 200 
var arc_height := 100.0  # высота дуги
var base_y := -260 


func change_emote(key):
	for emote in expression.values():
		emote.visible = false
	if expression.has(key):
		expression[key].visible = true
		
func change_cloth(key):
	for cloth in clothes.values():
		cloth.visible = false
	if clothes.has(key):
		clothes[key].visible = true

func change_accessory(key):
	for accessory in accessories.values():
		accessory.visible = false
	if accessories.has(key):
		accessories[key].visible = true

func change_hair(key):
	for hair_list in hairstyle.values():
		for hair in hair_list:
			hair.visible = false
	if hairstyle.has(key):
		for hair in hairstyle[key]:
			hair.visible = true

		
func change_blush(key):
	for blush in blushes.values():
		blush.visible = false
	if blushes.has(key):
		blushes[key].visible = true
		
		

func _process(delta):
	if is_holding:
		hand.position.x += move_speed * delta * direction
		if hand.position.x >= x_max:
			direction = -1
		elif hand.position.x <= x_min:
			direction = 1
		# Смещение по синусоиде для дуги (от 0 до π)
		var progress : float = (hand.position.x - x_min) / (x_max - x_min)  # от 0 до 1
		var y_offset : float = -sin(progress * PI) * arc_height  # синусоида

		# Применяем Y
		hand.position.y = base_y + y_offset


	
func _on_stroke_pressed() -> void:
	hand.visible = true
	is_holding = true
	hand.position = Vector2(0, -260)
	change_emote("Normal")
	change_blush("Blush2")
	


func _on_stroke_released() -> void:
	hand.visible = false
	is_holding = false
	change_emote("Smug")
	change_blush(null)
