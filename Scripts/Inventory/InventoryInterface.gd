extends Control

var grabbed_slot_data: SlotData

@onready var player_inventory: PanelContainer = $PlayerInventory
@onready var grabbed_slot: PanelContainer = $GrabbedSlot

func _physics_process(_delta):
	if grabbed_slot.visible:
		#this is where i will want to change the mouse cursor to the object being picked up. Something like this
		# Input.set_custom_mouse_cursor(slot_data.item_data, Input.CURSOR_ARROW)

		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5,5)

func SetPlayerInventoryData(inventory_data: InventoryData) -> void:
	inventory_data.inventory_interact.connect(OnInventoryInteract)
	player_inventory.SetInventoryData(inventory_data)

func OnInventoryInteract(inventory_data: InventoryData, index: int, button: int) -> void:
	match [grabbed_slot_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.GrabSlotData(index)
		[_, MOUSE_BUTTON_LEFT]: # _ is a wildcard that means anything that is not null
			grabbed_slot_data = inventory_data.DropSlotData(grabbed_slot_data, index)

	UpdateGrabbedSlot()

func UpdateGrabbedSlot() -> void:
	if grabbed_slot_data:
		grabbed_slot.show()
		grabbed_slot.SetSlotData(grabbed_slot_data)
	else:
		grabbed_slot.hide()
