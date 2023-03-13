
// Ex. "Foo"
function log(_str)
{
	show_debug_message(_str);
}

// Ex. "Foo: 14"
function logVal(_name, _val)
{
	log(_name + ": " + string(_val));
}

// Ex. ">>>>>>>>>> Foo <<<<<<<<<<"
function logImportant(_str)
{
	log(">>>>>>>>>> " + _str + " <<<<<<<<<<");
}