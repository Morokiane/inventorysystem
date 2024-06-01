extends Resource
class_name InventoryData

signal inventory_updated(inventory_data: InventoryData)
signal inventory_interact(inventory_data: InventoryData, index: int, button: int)

@export var slot_datas: Array[SlotData]

func GrabSlotData(index: int) -> SlotData:
	var slot_data = slot_datas[index]

	if slot_data:
		slot_datas[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null

func DropSlotData(grabbed_slot_data: SlotData, index: int) -> SlotData:
	var slot_data = slot_datas[index]

	var return_slot_data: SlotData
	if slot_data && slot_data.CanFullyMerge(grabbed_slot_data):
		slot_data.FullyMerge(grabbed_slot_data)
	else:
		slot_datas[index] = grabbed_slot_data
		return_slot_data = slot_data

	inventory_updated.emit(self)
	return return_slot_data

	# slot_datas[index] = grabbed_slot_data
	# inventory_updated.emit(self)
	# return slot_data

func OnSlotClicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)