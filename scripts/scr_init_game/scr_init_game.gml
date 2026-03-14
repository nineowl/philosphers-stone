function init_material_data() {
    var data = array_create(Material.Chimera + 1);

    data[Material.Water] = { 
		name: "Water",
		desc: "A common base material used in many transmutations.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Sand] = { 
		name: "Sand", 
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Clay] = { 
		name: "Clay",
	    desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Carbon] = { 
		name: "Carbon",
	    desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Sulfur] = { 
		name: "Sulfur",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
		};
    data[Material.Mercury] = { 
		name: "Mercury",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Iron] = { 
		name: "Iron",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Silver] = { 
		name: "Silver",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Gold] = { 
		name: "Gold",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Flowers] = { 
		name: "Flowers",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Fungi] = { 
		name: "Fungi",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Milk] = { 
		name: "Milk",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Blood] = { 
		name: "Blood",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Heart] = { 
		name: "Heart",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.FaerieJar] = { 
		name: "Faerie in Jar",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.SoulTiny] = { 
		name: "Tiny Soul",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.SoulRegular] = { 
		name: "Regular Soul",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.SoulEminent] = { 
		name: "Eminent Soul",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Saltwater] = { 
		name: "Saltwater",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Glass] = { 
		name: "Glass",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.WineGlass] = { 
		name: "Wine Glass",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Wine] = { 
		name: "Wine",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
	data[Material.Grapes] = { 
		name: "Grapes",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.HealthPotion] = { 
		name: "Health Potion",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.PoisonPotion] = { 
		name: "Poison Potion",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.AphrodisiacPotion] = { 
		name: "Aphrodisiac",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Sword] = { 
		name: "Sword",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Bomb] = { 
		name: "Bomb",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.IceCream] = { 
		name: "Ice Cream",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Homunculus] = { 
		name: "Homunculus",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Diamond] = { 
		name: "Diamond",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Amulet] = { 
		name: "Amulet",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Perfume] = { 
		name: "Perfume",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};
    data[Material.Chimera] = { 
		name: "Chimera",
		desc: "Needs a description.",
	    spr: sMaterials,
	    frame: 0
	};

    return data;
}

function init_recipe_data() {
    var recipes = [];

    // ----------------------
    // Tutorial / Separate
    // ----------------------

    array_push(recipes, {
        action: AlchemyAction.Separate,
        inputs: [Material.Saltwater],
        outputs: [
            { material: Material.Water, amount: 1 },
            { material: Material.Sand, amount: 1 }
        ]
    });


    // ----------------------
    // HIGH LEVEL
    // ----------------------

    // Wine Glass
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Glass],
        outputs: [
            { material: Material.WineGlass, amount: 1 }
        ]
    });

    // Wine
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Water, Material.Grapes, Material.Fungi],
        outputs: [
            { material: Material.Wine, amount: 1 }
        ]
    });

    // Health Potion
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Flowers, Material.Water, Material.SoulTiny],
        outputs: [
            { material: Material.HealthPotion, amount: 1 }
        ]
    });

    // Poison
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Water, Material.Fungi],
        outputs: [
            { material: Material.PoisonPotion, amount: 1 }
        ]
    });

    // Aphrodisiac
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Flowers, Material.Wine],
        outputs: [
            { material: Material.AphrodisiacPotion, amount: 1 }
        ]
    });

    // Sword
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Iron, Material.Carbon],
        outputs: [
            { material: Material.Sword, amount: 1 }
        ]
    });

    // Bomb
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Sulfur, Material.Carbon],
        outputs: [
            { material: Material.Bomb, amount: 1 }
        ]
    });

    // Ice Cream
    array_push(recipes, {
        action: AlchemyAction.Cold,
        inputs: [Material.Milk, Material.Flowers],
        outputs: [
            { material: Material.IceCream, amount: 1 }
        ]
    });

    // Homunculus
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.SoulRegular, Material.Heart, Material.Blood, Material.Clay],
        outputs: [
            { material: Material.Homunculus, amount: 1 }
        ]
    });

    // Diamond
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Carbon],
        outputs: [
            { material: Material.Diamond, amount: 1 }
        ]
    });

    // Amulet
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Iron, Material.Diamond],
        outputs: [
            { material: Material.Amulet, amount: 1 }
        ]
    });

    // Perfume
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Water, Material.Flowers],
        outputs: [
            { material: Material.Perfume, amount: 1 }
        ]
    });

    // Chimera
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Blood, Material.Heart, Material.SoulEminent, Material.Sulfur],
        outputs: [
            { material: Material.Chimera, amount: 1 }
        ]
    });


    // ----------------------
    // MID LEVEL
    // ----------------------

    // Gold
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Silver, Material.Mercury],
        outputs: [
            { material: Material.Gold, amount: 1 }
        ]
    });

    // Silver
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Iron, Material.Mercury],
        outputs: [
            { material: Material.Silver, amount: 1 }
        ]
    });

    // Glass
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Sand],
        outputs: [
            { material: Material.Glass, amount: 1 }
        ]
    });

    // Clay
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Sand, Material.Water],
        outputs: [
            { material: Material.Clay, amount: 1 }
        ]
    });


    return recipes;
}