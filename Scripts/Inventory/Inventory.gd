extends PanelContainer

const Slot = preload("res://inventory/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

func SetInventoryData(inventory_data: InventoryData) -> void:
	inventory_data.inventory_updated.connect(PopulateItemGrid)
	PopulateItemGrid(inventory_data)

func PopulateItemGrid(inventory_data: InventoryData) -> void:
	for child in item_grid.get_children():
		child.queue_free()

	for slot_data in inventory_data.slot_datas:
		var slot = Slot.instantiate()
		item_grid.add_child(slot)

		slot.slot_clicked.connect(inventory_data.OnSlotClicked)

		if slot_data:
			slot.SetSlotData(slot_data)
