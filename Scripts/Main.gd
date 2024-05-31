extends Node

@onready var player: CharacterBody3D = $Player
@onready var inventory_interface: Control = $UI/InventoryInterface

func _ready():
	player.toggle_inventory.connect(ToggleInventoryInterface)
	inventory_interface.SetPlayerInventoryData(player.inventory_data)
		
func ToggleInventoryInterface():
	inventory_interface.visible = !inventory_interface.visible

	if inventory_interface.visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED