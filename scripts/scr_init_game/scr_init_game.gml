function init_material_data() {
    var data = array_create(Material.Chimera + 1);

    data[Material.Water] = { 
		name: "Water",
		desc: "A common base material used in many transmutations.",
	    spr: sMaterials,
	    frame: 10
	};
    data[Material.Sand] = { 
		name: "Sand", 
		desc: "Can be made into glass.",
	    spr: sMaterials,
	    frame: 20
	};
    data[Material.Clay] = { 
		name: "Clay",
	    desc: "They say God made human's from clay.",
	    spr: sMaterials,
	    frame: 22
	};
    data[Material.Carbon] = { 
		name: "Carbon",
	    desc: "The basis for all life.",
	    spr: sMaterials,
	    frame: 23
	};
    data[Material.Sulfur] = { 
		name: "Sulfur",
		desc: "Strong scent, powerful and foundational.",
	    spr: sMaterials,
	    frame: 21
		};
    data[Material.Mercury] = { 
		name: "Mercury",
		desc: "Foundational liquid in Alchemy.",
	    spr: sMaterials,
	    frame: 12
	};
    data[Material.Iron] = { 
		name: "Iron",
		desc: "Reliable and abundant metal.",
	    spr: sMaterials,
	    frame: 30
	};
    data[Material.Silver] = { 
		name: "Silver",
		desc: "Bright and precious, but tarnishes.",
	    spr: sMaterials,
	    frame: 31
	};
    data[Material.Gold] = { 
		name: "Gold",
		desc: "Iridiscent, doesn't rust nor tarnish, of great value.",
	    spr: sMaterials,
	    frame: 32
	};
    data[Material.Flowers] = { 
		name: "Flowers",
		desc: "Beautiful, fragrant.",
	    spr: sMaterials,
	    frame: 43
	};
    data[Material.Fungi] = { 
		name: "Fungi",
		desc: "Mysterious, symbiotic.",
	    spr: sMaterials,
	    frame: 45
	};
    data[Material.Milk] = { 
		name: "Milk",
		desc: "High in protein, staple culinary ingredient.",
	    spr: sMaterials,
	    frame: 11
	};
    data[Material.Blood] = { 
		name: "Blood",
		desc: "Abundant, Taboo, Sacred.",
	    spr: sMaterials,
	    frame: 13
	};
    data[Material.Heart] = { 
		name: "Heart",
		desc: "Where did this come from?",
	    spr: sMaterials,
	    frame: 55
	};
    data[Material.FaerieJar] = { 
		name: "Faerie in Jar",
		desc: "Magical, rare and full of life.",
	    spr: sMaterials,
	    frame: 51
	};
    data[Material.SoulTiny] = { 
		name: "Tiny Soul",
		desc: "Tiny soul trapped in a gem. Likely that of a beggar.",
	    spr: sMaterials,
	    frame: 70
	};
    data[Material.SoulRegular] = { 
		name: "Regular Soul",
		desc: "Soul trapped in a gem. Smells of forbidden magic",
	    spr: sMaterials,
	    frame: 71
	};
    data[Material.SoulEminent] = { 
		name: "Eminent Soul",
		desc: "Soul of a pure heart, how cruel.",
	    spr: sMaterials,
	    frame: 72
	};
    data[Material.Saltwater] = { 
		name: "Saltwater",
		desc: "Taste of the ocean.",
	    spr: sMaterials,
	    frame: 1
	};
    data[Material.Glass] = { 
		name: "Glass",
		desc: "Clear, hard, and brittle.",
	    spr: sMaterials,
	    frame: 62
	};
    data[Material.WineGlass] = { 
		name: "Wine Glass",
		desc: "You think I drink straight from the bottle?",
	    spr: sMaterials,
	    frame: 63
	};
    data[Material.Wine] = { 
		name: "Wine",
		desc: "No party is complete without wine.",
	    spr: sMaterials,
	    frame: 65
	};
	data[Material.Grapes] = { 
		name: "Grapes",
		desc: "Tastes better when fed to you.",
	    spr: sMaterials,
	    frame: 7
	};
    data[Material.HealthPotion] = { 
		name: "Health Potion",
		desc: "Restores your overall health. Even regenerates limbs.",
	    spr: sMaterials,
	    frame: 75
	};
    data[Material.PoisonPotion] = { 
		name: "Poison Potion",
		desc: "For 'rats'.",
	    spr: sMaterials,
	    frame: 76
	};
    data[Material.AphrodisiacPotion] = { 
		name: "Aphrodisiac",
		desc: "A little get up and go.",
	    spr: sMaterials,
	    frame: 77
	};
    data[Material.Sword] = { 
		name: "Sword",
		desc: "I like swords.",
	    spr: sMaterials,
	    frame: 15
	};
    data[Material.Bomb] = { 
		name: "Bomb",
		desc: "Explosive.",
	    spr: sMaterials,
	    frame: 16
	};
    data[Material.IceCream] = { 
		name: "Ice Cream",
		desc: "Quick, before it melts!",
	    spr: sMaterials,
	    frame: 17
	};
    data[Material.Homunculus] = { 
		name: "Homunculus",
		desc: "Hey there little guy.",
	    spr: sMaterials,
	    frame: 36
	};
    data[Material.Diamond] = { 
		name: "Diamond",
		desc: "Pressure makes diamonds they say.",
	    spr: sMaterials,
	    frame: 24
	};
    data[Material.Amulet] = { 
		name: "Amulet",
		desc: "Shiny, draws attention to the right places.",
	    spr: sMaterials,
	    frame: 25
	};
    data[Material.Perfume] = { 
		name: "Perfume",
		desc: "For your stinky coworker.",
	    spr: sMaterials,
	    frame: 26
	};
    data[Material.Chimera] = { 
		name: "Chimera",
		desc: "Cute, fluffly, vicious.",
	    spr: sMaterials,
	    frame: 37
	};
	    data[Material.PhilosopherStone] = { 
		name: "Philosopher Stone",
		desc: "A better stone at last.",
	    spr: sMaterials,
	    frame: 37
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
        ],
		discovered: true
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
        ],
		discovered: true
    });

    // Wine
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Water, Material.Grapes, Material.Fungi],
        outputs: [
            { material: Material.Wine, amount: 1 }
        ],
		discovered: false
    });

    // Health Potion
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Flowers, Material.Water, Material.SoulTiny],
        outputs: [
            { material: Material.HealthPotion, amount: 1 }
        ],
		discovered: false
    });

    // Poison
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Water, Material.Fungi],
        outputs: [
            { material: Material.PoisonPotion, amount: 1 }
        ],
		discovered: false
    });

    // Aphrodisiac
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Flowers, Material.Wine],
        outputs: [
            { material: Material.AphrodisiacPotion, amount: 1 }
        ],
		discovered: false
    });

    // Sword
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Iron, Material.Carbon],
        outputs: [
            { material: Material.Sword, amount: 1 }
        ],
		discovered: false
    });

    // Bomb
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Sulfur, Material.Carbon],
        outputs: [
            { material: Material.Bomb, amount: 1 }
        ],
		discovered: false
    });

    // Ice Cream
    array_push(recipes, {
        action: AlchemyAction.Cold,
        inputs: [Material.Milk, Material.Flowers],
        outputs: [
            { material: Material.IceCream, amount: 1 }
        ],
		discovered: false
    });

    // Homunculus
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.SoulRegular, Material.Heart, Material.Blood, Material.Clay],
        outputs: [
            { material: Material.Homunculus, amount: 1 }
        ],
		discovered: false
    });

    // Diamond
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Carbon],
        outputs: [
            { material: Material.Diamond, amount: 1 }
        ],
		discovered: false
    });

    // Amulet
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Iron, Material.Diamond],
        outputs: [
            { material: Material.Amulet, amount: 1 }
        ],
		discovered: false
    });

    // Perfume
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Water, Material.Flowers],
        outputs: [
            { material: Material.Perfume, amount: 1 }
        ],
		discovered: false
    });

    // Chimera
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Blood, Material.Heart, Material.SoulEminent, Material.Sulfur],
        outputs: [
            { material: Material.Chimera, amount: 1 }
        ],
		discovered: false
    });
	
	//Philosopher's Stone
	array_push(recipes, {
    action: AlchemyAction.Combine,
	    inputs: [Material.Heart, Material.Homunculus, Material.SoulEminent],
	    outputs: [
	        { material: Material.PhilosopherStone, amount: 1 }
	    ],
	    discovered: false
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
        ],
		discovered: false
    });

    // Silver
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Iron, Material.Mercury],
        outputs: [
            { material: Material.Silver, amount: 1 }
        ],
		discovered: false
    });

    // Glass
    array_push(recipes, {
        action: AlchemyAction.Heat,
        inputs: [Material.Sand],
        outputs: [
            { material: Material.Glass, amount: 1 }
        ],
		discovered: false
    });

    // Clay
    array_push(recipes, {
        action: AlchemyAction.Combine,
        inputs: [Material.Sand, Material.Water],
        outputs: [
            { material: Material.Clay, amount: 1 }
        ],
		discovered: false
    });


    return recipes;
}