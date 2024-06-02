extends Resource
class_name SlotData

const maxStackSize: int = 99

@export var item_data: ItemData
@export_range(1, maxStackSize) var quantity: int = 1: set = SetQuantity

func CanFullyMerge(other_slot_data: SlotData) -> bool:
	return item_data == other_slot_data.item_data && item_data.stackable && quantity + other_slot_data.quantity <= maxStackSize

func CanMerge(other_slot_data: SlotData) -> bool:
	return item_data == other_slot_data.item_data && item_data.stackable && quantity < maxStackSize

func FullyMerge(other_slot_data: SlotData) -> void:
	quantity += other_slot_data.quantity

func CreateSingleSlotData() -> SlotData:
	var new_slot_data = duplicate()
	new_slot_data.quantity = 1
	quantity -= 1
	return new_slot_data

func SetQuantity(value: int) -> void:
	quantity = value
	if quantity > 1 && !item_data.stackable:
		quantity = 1
		push_error("%s is not stackable, setting to 1" % item_data.name)