using Godot;
using System;

public partial class Main : Node
{
	private GodotObject _sqliteParser;

	public override void _Ready()
	{
		GDScript gdScript = (GDScript)GD.Load("res://Scripts/SQLiteParser.gd");
        _sqliteParser = (GodotObject)gdScript.New();
        _sqliteParser.Call("Init", null);

	}

}
