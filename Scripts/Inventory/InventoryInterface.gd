extends Control

var grabbed_slot_data: SlotData

@onready var player_inventory: PanelContainer = $PlayerInventory

func SetPlayerInventoryData(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(OnInventoryInteract)
	player_inventory.SetInventoryData(inventory_data)

func OnInventoryInteract(inventory_data: InventoryData, index: int, button: int) -> void:
	match [grabbed_slot_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.GrabSlotData(index)

	print(grabbed_slot_data)