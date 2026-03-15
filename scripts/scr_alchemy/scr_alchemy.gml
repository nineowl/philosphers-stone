function stone_spend_charge(_amount) {
    if (global.stone_level == StoneLevel.Master) {
        return true;
    }

    if (global.stone_charge >= _amount) {
        global.stone_charge -= _amount;

        if (global.stone_charge <= 0) {
            global.stone_charge = 0;
            global.game_lost = true;
        }

        return true;
    }

    return false;
}

function normalize_material_array(_arr) {
    var out = [];

    for (var i = 0; i < array_length(_arr); i++) {
        array_push(out, _arr[i]);
    }

    array_sort(out, true);

    return out;
}

function arrays_equal(_a, _b) {
    if (array_length(_a) != array_length(_b)) return false;

    for (var i = 0; i < array_length(_a); i++) {
        if (_a[i] != _b[i]) return false;
    }

    return true;
}

function find_recipe_index(_action, _inputs) {
    var selected_inputs = normalize_material_array(_inputs);

    for (var i = 0; i < array_length(global.recipes); i++) {
        var recipe = global.recipes[i];

        if (recipe.action != _action) continue;

        var recipe_inputs = normalize_material_array(recipe.inputs);

        if (arrays_equal(selected_inputs, recipe_inputs)) {
            return i;
        }
    }

    return -1;
}


function try_alchemy(_action, _inputs) {
    if (global.game_lost || global.game_won) return false;
    if (array_length(_inputs) <= 0) return false;

    if (!stone_spend_charge(1)) {
        global.last_message = "Not enough charge.";
        return false;
    }

    // remove inputs first
    for (var i = 0; i < array_length(_inputs); i++) {
        inventory_remove(_inputs[i], 1);
    }

	var recipe_index = find_recipe_index(_action, _inputs);

	if (recipe_index == -1) {
	    array_push(global.failure_items, {
	        materials: _inputs
	    });

	    global.last_message = "Alchemy failed.";
	    return false;
	}

	var recipe = global.recipes[recipe_index];
	recipe.discovered = true;
	global.recipes[recipe_index] = recipe;

	inventory_add_outputs(recipe.outputs);
	global.last_message = "Alchemy succeeded.";
	return true;

}

function rewind_failure(_failure_index) {
    if (_failure_index < 0 || _failure_index >= array_length(global.failure_items)) return false;

    if (!stone_spend_charge(1)) {
        global.last_message = "Not enough charge to rewind.";
        return false;
    }

    var failure = global.failure_items[_failure_index];

    for (var i = 0; i < array_length(failure.materials); i++) {
        inventory_add(failure.materials[i], 1);
    }

    array_delete(global.failure_items, _failure_index, 1);
    global.last_message = "Failure rewound.";
    return true;
}

function action_name(_action) {
    switch (_action) {
        case AlchemyAction.Separate: return "Separate";
        case AlchemyAction.Combine: return "Combine";
        case AlchemyAction.Heat: return "Heat";
        case AlchemyAction.Cold: return "Cold";
        case AlchemyAction.Rewind: return "Rewind";
    }

    return "Unknown";
}

function recharge_stone_with_heart() {
    if (!inventory_has(Material.Heart, 1)) {
        global.last_message = "You do not have a heart.";
        return false;
    }

    if (global.stone_charge >= global.stone_max_charge) {
        global.last_message = "Stone is already fully charged.";
        return false;
    }

    inventory_remove(Material.Heart, 1);
    global.stone_charge = min(global.stone_max_charge, global.stone_charge + 3);
    global.last_message = "Stone recharged.";
    return true;
}
