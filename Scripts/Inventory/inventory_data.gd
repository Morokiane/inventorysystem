extends Resource
class_name InventoryData

signal inventory_interact(inventory_data: InventoryData, index: int, button: int)

@export var slot_datas: Array[SlotData]

func GrabSlotData(index: int) -> SlotData:
	var slot_data = slot_datas[index]

	if slot_data:
		return slot_data
	else:
		return null

func OnSlotClicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)