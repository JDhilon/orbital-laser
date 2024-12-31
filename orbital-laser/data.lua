-- add a new entity based on the accumulater
data:extend({
    {
        type = "accumulator",
        name = "orbital-laser",
        icon = "__base__/graphics/icons/accumulator.png",
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.1, result = "orbital-laser" },
        fast_replaceable_group = "accumulator",
        max_health = 150,
        corpse = "accumulator-remnants",
        collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
        selection_box = { { -1, -1 }, { 1, 1 } },
        energy_source =
        {
            type = "electric",
            buffer_capacity = "5MJ",
            usage_priority = "tertiary",
            input_flow_limit = "300kW",
            output_flow_limit = "300kW"
        },
        chargable_graphics =
        {
            picture = accumulator_picture(),
            charge_animation = accumulator_charge(),
            charge_cooldown = 30,
            discharge_animation = accumulator_discharge(),
            discharge_cooldown = 60
        },
        water_reflection = accumulator_reflection(),
        working_sound =
        {
            main_sounds =
            {
                {
                    sound = { filename = "__base__/sound/accumulator-working.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44) },
                    match_volume_to_activity = true,
                    activity_to_volume_modifiers = { offset = 2, inverted = true },
                    fade_in_ticks = 4,
                    fade_out_ticks = 20
                },
                {
                    sound = { filename = "__base__/sound/accumulator-discharging.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44) },
                    match_volume_to_activity = true,
                    activity_to_volume_modifiers = { offset = 1 },
                    fade_in_ticks = 4,
                    fade_out_ticks = 20
                }
            },
            idle_sound = { filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35 },
            max_sounds_per_type = 3,
            audible_distance_modifier = 0.5
        },

        circuit_connector = circuit_connector_definitions["accumulator"],
        circuit_wire_max_distance = default_circuit_wire_max_distance,

        default_output_signal = { type = "virtual", name = "signal-A" },
        -- can only place this entity in space
        surface_conditions = {
            {
                property = "pressure",
                min = 0,
                max = 0,
            }
        }
    },
})


-- copy artillery-turret item and change it's icon to red
local orbitalLaser = table.deepcopy(data.raw["item"]["artillery-turret"])

orbitalLaser.name = "orbital-laser"
orbitalLaser.icons = {
    {
        icon = orbitalLaser.icon,
        icon_size = orbitalLaser.icon_size,
        tint = { r = 1, g = 0, b = 0, a = 0.3 }
    },
}

-- make this item place the entity we defined above
orbitalLaser.place_result = "orbital-laser"


-- create the recipe prototype from scratch
local recipe = {
    type = "recipe",
    name = "orbital-laser",
    enabled = true,
    energy_required = 1,
    ingredients = {
        { type = "item", name = "steel-plate", amount = 1 }
    },
    results = { { type = "item", name = "orbital-laser", amount = 1 } }
}

data:extend { orbitalLaser, recipe }
