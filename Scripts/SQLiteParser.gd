#extends Node

#const SQLite = preload("res://addons/godot-sqlite/godot-sqlite-wrapper.gd")
var db : SQLite = null

var title = "title_rus"
var descr = "descr_rus"

	
func Init ():
	var db_name_res = "res://sqlite.db"
	var db_name_user = "user://sqlite.db"

	print ("Copy file now")
	print( DirAccess.copy_absolute(db_name_res, db_name_user))
	
	db = SQLite.new()
	db.path = db_name_user
	
	db.open_db()

	
func GetPlant (id : int ) -> Array:
	var resArray: Array
	var select_condition : String = "id = " + str(id)
	resArray = db.select_rows("Plant", select_condition, ["fileName", "size", "rowsInTexture", title, descr, "isWalkable"])
	return resArray
	
	
func GetGround (id : int) -> Array:
	var resArray: Array
	var select_condition : String = "id = " + str(id)
	resArray = db.select_rows("Ground", select_condition, ["colorForShader", title, "decorID"])
	return resArray
	
func GetBuilding (id : int) -> Array:
	var resArray: Array
	var select_condition : String = "id = " + str(id)
	resArray = db.select_rows("Building", select_condition, ["sizeX", "sizeY", title, "fileName"])
	return resArray
	
func GetAnimal (id : int) -> Array:
	var resArray: Array
	var select_condition : String = "id = " + str(id)
	resArray = db.select_rows("Animal", select_condition, [title, "fileName"])
	return resArray
