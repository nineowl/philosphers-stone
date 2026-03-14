function inventory_add(_material, _amount) {
    global.inventory[_material] += _amount;
}

function inventory_has(_material, _amount) {
    return global.inventory[_material] >= _amount;
}

function inventory_remove(_material, _amount) {
    if (inventory_has(_material, _amount)) {
        global.inventory[_material] -= _amount;
        return true;
    }
    return false;
}

function inventory_add_outputs(_outputs) {
    for (var i = 0; i < array_length(_outputs); i++) {
        inventory_add(_outputs[i].material, _outputs[i].amount);
    }
}
function selected_count_of(_material) {
    var count = 0;

    for (var i = 0; i < array_length(global.selected_materials); i++) {
        if (global.selected_materials[i] == _material) {
            count++;
        }
    }

    return count;
}

function inventory_nonzero_count() {
    var count = 0;

    for (var i = 0; i < array_length(global.inventory); i++) {
        if (global.inventory[i] > 0) {
            count++;
        }
    }

    return count;
}

function inventory_get_visible_materials(_scroll, _max_rows) {
    var _visible = [];
    var nonzero_index = 0;

    for (var m = 0; m < array_length(global.inventory); m++) {
        if (global.inventory[m] > 0) {
            if (nonzero_index >= _scroll && array_length(_visible) < _max_rows) {
                array_push(_visible, m);
            }

            nonzero_index++;
        }
    }

    return _visible;
}