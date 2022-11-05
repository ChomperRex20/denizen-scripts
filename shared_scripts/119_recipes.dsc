##ZC Recipe Scripts. Created by EyelessTenshi and SentisUrgelius

#Recipe Materials and Drop Scripts--

malice_fragment:
  type: item
  debug: false
  material: echo_shard
  data:
    discover: true
  display name: <&color[#8B159C]>Malice Fragment
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 100
    hides:
      - ENCHANTS
  lore:
   - <&color[#A03485]>A fragment of malice
   - <&color[#A03485]>left behind by the Calamity.
   - <&color[#A03485]>What power does it hold?

malice_fragment_drop:
  type: world
  events:
    on player kills warden:
    - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - drop malice_fragment

compressed_sculk:
  type: item
  debug: false
  material: echo_shard
  data:
    discover: true
  display name: <&color[#087285]>Compressed Sculk
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 200
    hides:
      - ENCHANTS
  lore:
  - <&color[#1697AF]>A compressed mass of sculk.
  - <&color[#1697AF]>It pulsates with otherwordly flesh.
  recipes:
    1:
      type: shaped
      input:
        - sculk|sculk|sculk
        - sculk|sculk|sculk
        - sculk|sculk|sculk

fragmented_sculk:
  type: item
  debug: false
  material: echo_shard
  data:
    discover: true
  display name: <&color[#087285]>Fragmented <&color[#CFCCA5]>Sculk
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 300
    hides:
      - ENCHANTS
  lore:
  - <&color[#1697AF]>A combination of two worlds.
  - <&color[#DCD9B4]>Combined with the right materials
  - <&color[#1697AF]>it can be quite powerful.
  recipes:
    1:
      type: shaped
      input:
        - sculk|end_stone|sculk
        - end_stone|ender_eye|end_stone
        - sculk|end_stone|sculk

sculk_string:
  type: item
  debug: false
  material: string
  display name: <&color[#1697AF]>Sculk String
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
  lore:
    - <&3>A piece of tainted string.
  recipes:
    1:
      type: smithing
      base: string
      upgrade: sculk

tempered_iron_plate:
  type: item
  debug: false
  material: iron_ingot
  data:
    discover: true
  display name: <&color[#999999]>Tempered Iron Plate
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 200
    hides:
      - ENCHANTS
  lore:
    - <&7>A solid plate perfect for
    - <&7>armor smithing.
  recipes:
    1:
      type: shaped
      input:
        - zc_tempered_iron|zc_tempered_iron|zc_tempered_iron
        - zc_tempered_iron|zc_tempered_iron_block|zc_tempered_iron
        - zc_tempered_iron|zc_tempered_iron|zc_tempered_iron

cured_quartz:
  type: item
  debug: false
  material: quartz
  data:
    discover: true
  display name: <&color[#BE7CEA]>Cured Quartz
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 100
    hides:
      - ENCHANTS
  lore:
    - <&color[#E9C8FF]>This quartz has been cleansed
    - <&color[#E9C8FF]>with amethyst, offering protection
    - <&color[#E9C8FF]>and guidance.
  recipes:
    1:
      type: shaped
      input:
        - quartz|amethyst_shard|quartz
        - amethyst_shard|quartz|amethyst_shard
        - quartz|amethyst_shard|quartz

cured_quartz_plate:
  type: item
  debug: false
  material: quartz
  data:
    discover: true
  display name: <&color[#BE7CEA]>Cured Quartz Plate
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 200
    hides:
      - ENCHANTS
  lore:
    - <&color[#E9C8FF]>A plate forged from
    - <&color[#E9C8FF]>cured quartz. You can
    - <&color[#E9C8FF]>feel it's purity.
  recipes:
    1:
      type: shaped
      input:
        - cured_quartz|cured_quartz|cured_quartz
        - cured_quartz|amethyst_cluster|cured_quartz
        - cured_quartz|cured_quartz|cured_quartz

mythril_dragon_scale:
  type: item
  debug: false
  material: flint
  data:
    discover: true
  display name: <&color[#79A6E2]>Mythril Dragon Scale
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 1000
  lore:
    - <&color[#A7CCFD]>Stronger than steel
    - <&color[#A7CCFD]>but at what cost?
  recipes:
    1:
      type: shaped
      input:
        - zc_dragon_scale|zc_dragon_scale|zc_dragon_scale
        - zc_dragon_scale|zc_mythril|zc_dragon_scale
        - zc_dragon_scale|zc_dragon_scale|zc_dragon_scale

reinforced_string:
  type: item
  debug: false
  material: string
  display name: <&color[#7934AD]>Reinforced String
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
    custom_model_data: 300
  lore:
    - <&color[#9553C6]>A sturdy spool of reinforced string.

loftwing_feather:
  type: item
  debug: false
  material: feather
  display name: <&4>Loftwing Feather
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
    custom_model_data: 100
  lore:
    - <&c>A crimson feather dropped
    - <&c>by a large Loftwing.

loftwing_feathers_drop:
  type: world
  events:
    on player kills parrot:
    - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - drop loftwing_feather[quantity=<util.random.int[1].to[3]>]

wizzrobe_crystal:
  type: item
  debug: false
  material: amethyst_shard
  display name: <&5>Wizzrobe Crystal
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
  lore:
    - <&d>A crystal broken off
    - <&d>from a Wizzrobe's robe.

wizzrobe_crystals_drop:
  type: world
  events:
    on player kills evoker:
    - define droprate 2
    - if <util.random_chance[<[droprate]>]>:
      - drop wizzrobe_crystal[quantity=<util.random.int[1].to[3]>]

enhanced_loftwing_feather:
  type: item
  debug: false
  material: feather
  display name: <&color[#AC7EFF]>Enhanced Loftwing Feather
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 200
    hides:
      - ENCHANTS
  lore:
    - <&color[#B999E6]>Once a simple feather
    - <&color[#B999E6]>now gleaming with magic.
  recipes:
    1:
      type: smithing
      base: loftwing_feather
      upgrade: wizzrobe_crystal

onox_shard:
  type: item
  debug: false
  material: flint
  display name: <&color[#6F6F6F]>Onox Shard
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
  lore:
    - <&color[#8B8B8B]>A shard of solid onox that
    - <&color[#8B8B8B]>reminds you of a seasons long past.


onox_shard_drop:
  type: world
  events:
    on player breaks crying_obsidian:
    - if <player.item_in_hand.material.name> != netherite_pickaxe:
      - stop
    - define droprate 0.5
    - if <player.item_in_hand.enchantment_map.contains[fortune]>:
      - if <player.item_in_hand.enchantment_map.get[fortune]> == 1:
        - define droprate 1
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 2:
        - define droprate 2.5
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 3:
        - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - determine onox_shard[quantity=<util.random.int[1].to[3]>]

deku_root:
  type: item
  debug: false
  material: stick
  display name: <&color[#806345]>Deku Root
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
    custom_model_data: 800
  lore:
    - <&color[#AD865E]>A root from remnants
    - <&color[#AD865E]>of ancient deku trees.

deku_root_drop:
  type: world
  events:
    on player breaks rooted_dirt:
    - if <player.item_in_hand.material.name> != netherite_shovel:
      - stop
    - define droprate 0.5
    - if <player.item_in_hand.enchantment_map.contains[fortune]>:
      - if <player.item_in_hand.enchantment_map.get[fortune]> == 1:
        - define droprate 1
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 2:
        - define droprate 2.5
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 3:
        - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - determine deku_root[quantity=<util.random.int[1].to[3]>]

skulltula_silk:
  type: item
  debug: false
  material: string
  display name: <&7>Skulltula Silk
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
    custom_model_data: 100
  lore:
    - <&f>Silk from a giant spider.

skulltula_silk_drop:
  type: world
  events:
    on player kills cave_spider:
    - define droprate 2
    - if <util.random_chance[<[droprate]>]>:
      - drop skulltula_silk[quantity=<util.random.int[1].to[3]>]

gold_skulltula_silk:
  type: item
  debug: false
  material: string
  display name: <&6>Gold Skulltula Silk
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 200
    hides:
      - ENCHANTS
  lore:
    - <&e>Silk that seems to be
    - <&e>spun from solid gold.
  recipes:
    1:
      type: smithing
      base: skulltula_silk
      upgrade: gold_dust

gold_dust:
  type: item
  debug: false
  material: glowstone_dust
  display name: <&6>Gold Dust
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
    custom_model_data: 1000
  lore:
    - <&e>Mined by the Gorons of old,
    - <&e>it's quite explosive.

gold_dust_drop:
  type: world
  events:
    on player breaks deepslate_gold_ore:
    - if <player.item_in_hand.material.name> != netherite_pickaxe:
      - stop
    - define droprate 0.5
    - if <player.item_in_hand.enchantment_map.contains[fortune]>:
      - if <player.item_in_hand.enchantment_map.get[fortune]> == 1:
        - define droprate 1
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 2:
        - define droprate 2.5
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 3:
        - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - determine gold_dust[quantity=<util.random.int[1].to[3]>]

chu_chu_jelly:
  type: item
  debug: false
  material: slime_ball
  display name: <&2>Chu Chu Jelly
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
  lore:
    - <&a>A gelatinous ball of
    - <&a>green chu chu jelly.
    - <&a>It smells.

chu_chu_jelly_drop:
  type: world
  events:
    on player kills slime:
    - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - drop chu_chu_jelly[quantity=<util.random.int[1].to[3]>]

keaton_fur_tuft:
  type: item
  debug: false
  material: rabbit
  display name: <&6>Keaton Fur Tuft
  enchantments:
    - LUCK: 1
  mechanisms:
    hides:
      - ENCHANTS
    custom_model_data: 100
  lore:
    - <&e>A piece of shedded fur
    - <&e>from a Keaton.

keaton_fur_drop:
  type: world
  events:
    on fox breeds:
    - define droprate 2
    - if <util.random_chance[<[droprate]>]>:
      - drop keaton_fur_tuft[quantity=<util.random.int[1].to[3]>]

plate_of_power:
  type: item
  debug: false
  material: fermented_spider_eye
  data:
    discover: true
  display name: <&color[#b63737]>Plate of Power
  mechanisms:
    custom_model_data: 600
    enchantments:
      - LUCK: 1
    hides:
      - ENCHANTS
  lore:
    - <&color[#d24848]>Forged from the
    - <&color[#d24848]>fallen souls. Power
    - <&color[#d24848]>overcomes weakness.
  recipes:
    1:
      type: shaped
      input:
        - zc_shard_of_power|zc_shard_of_power|zc_shard_of_power
        - zc_shard_of_power|zc_shard_of_power|zc_shard_of_power
        - zc_shard_of_power|zc_shard_of_power|zc_shard_of_power

plate_of_wisdom:
  type: item
  debug: false
  material: gold_ingot
  data:
    discover: true
  display name: <&color[#f1c232]>Plate of Wisdom
  mechanisms:
    custom_model_data: 400
    enchantments:
      - LUCK: 1
    hides:
      - ENCHANTS
  lore:
    - <&color[#ffe599]>From the brighest
    - <&color[#ffe599]>of minds come the
    - <&color[#ffe599]>strongest warriors.
  recipes:
    1:
      type: shaped
      input:
        - zc_wisdom_shard|zc_wisdom_shard|zc_wisdom_shard
        - zc_wisdom_shard|zc_wisdom_shard|zc_wisdom_shard
        - zc_wisdom_shard|zc_wisdom_shard|zc_wisdom_shard

plate_of_courage:
  type: item
  debug: false
  material: scute
  data:
    discover: true
  display name: <&color[#6aa84f]>Plate of Courage
  mechanisms:
    custom_model_data: 600
    enchantments:
      - LUCK: 1
    hides:
      - ENCHANTS
  lore:
    - <&color[#b6d7a8]>Let tenacity and
    - <&color[#b6d7a8]>determination shine
    - <&color[#b6d7a8]>strong without fear.
  recipes:
    1:
      type: shaped
      input:
        - zc_courage_shard|zc_courage_shard|zc_courage_shard
        - zc_courage_shard|zc_courage_shard|zc_courage_shard
        - zc_courage_shard|zc_courage_shard|zc_courage_shard

timestone_shard:
  type: item
  debug: false
  material: flint
  data:
    discover: true
  display name: <&color[#5F5EAD]>Timestone Shard
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 1700
    hides:
      - ENCHANTS
  lore:
    - <&color[#5EADA3]>A fragment of a timestone
    - <&color[#5EAD69]>lost to the Era of the Sky.

obsidian_plate:
  type: item
  debug: false
  material: flint
  data:
    discover: true
  display name: <&color[#7A13B0]>Obsidian Plate
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 1500
    hides:
      - ENCHANTS
  lore:
    - <&color[#A12EE7]>Forged from the tears
    - <&color[#A12EE7]>of lost souls.
  recipes:
    1:
      type: shaped
      input:
        - crying_obsidian|crying_obsidian|crying_obsidian
        - crying_obsidian|netherite_ingot|crying_obsidian
        - crying_obsidian|crying_obsidian|crying_obsidian

gear_of_time:
  type: item
  debug: false
  material: flint
  data:
    discover: true
  display name: <&color[#E0A7FD]>Gear of Time
  enchantments:
    - LUCK: 1
  mechanisms:
    custom_model_data: 300
    hides:
      - ENCHANTS
  lore:
    - <&color[#F6A7FD]>A fragment of the Gate of Hylia
    - <&color[#CC75FE]>lost long ago. Perhaps with time,
    - <&color[#8567FF]>it shall work again.


gear_of_time_drop:
  type: world
  events:
    on player breaks budding_amethyst:
    - if <player.item_in_hand.material.name> != netherite_pickaxe:
      - stop
    - define droprate 0.5
    - if <player.item_in_hand.enchantment_map.contains[fortune]>:
      - if <player.item_in_hand.enchantment_map.get[fortune]> == 1:
        - define droprate 1
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 2:
        - define droprate 2.5
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 3:
        - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - determine gear_of_time[quantity=<util.random.int[1].to[3]>]


timestone_shard_drop:
  type: world
  events:
    on player breaks deepslate_lapis_ore|deepslate_emerald_ore:
    - if <player.item_in_hand.material.name> != netherite_pickaxe:
      - stop
    - define droprate 0.5
    - if <player.item_in_hand.enchantment_map.contains[fortune]>:
      - if <player.item_in_hand.enchantment_map.get[fortune]> == 1:
        - define droprate 1
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 2:
        - define droprate 2.5
      - else if <player.item_in_hand.enchantment_map.get[fortune]> == 3:
        - define droprate 5
    - if <util.random_chance[<[droprate]>]>:
      - determine timestone_shard[quantity=<util.random.int[1].to[3]>]

# Actual crafted recipe items and item events--

calamitous_boots:
  type: item
  material: NETHERITE_BOOTS
  data:
    discover: true
  display name: <&color[#580464]>Calamitous Boots
  enchantments:
    - PROTECTION_ENVIRONMENTAL:4
    - DURABILITY:3
    - SWIFT_SNEAK:3
  mechanisms:
    hides:
      - enchants
  lore:
        - <&color[#A03485]>Boots crafted from remnants
        - <&color[#A03485]>of a haunted past.
  recipes:
    1:
      type: shaped
      input:
        - malice_fragment|air|malice_fragment
        - malice_fragment|air|malice_fragment

calamitous_boots_world:
  type: world
  events:
      after player equips calamitous_boots:
       - cast increase_damage amplifier:1.0 duration:1639
       - cast darkness duration:1639
       - playsound <player.location> sound:ENTITY_WARDEN_SONIC_BOOM volume:1.5
      on delta time secondly:
        - foreach <server.online_players.filter[has_equipped[calamitous_boots]]> as:__player:
          - playeffect effect:sonic_boom quantity:5 at:<player.location>
      after player unequips calamitous_boots:
       - cast increase_damage remove
       - cast darkness remove

soul_bow:
  type: item
  debug: false
  material: bow
  data:
    discover: true
  display name: <&3>Soul<&color[#087285]>Bow
  enchantments:
    - ARROW_DAMAGE: 5
    - ARROW_INFINITE: 1
  lore:
  - <&color[#1697AF]>Crafted with deadly precision
  - <&3>this bow of those lost to battle
  - <&color[#1697AF]>still damages those from beyond the grave.
  recipes:
    1:
      type: shaped
      input:
        - air|fragmented_sculk|sculk_string
        - fragmented_sculk|air|sculk_string
        - air|fragmented_sculk|sculk_string

soul_bow_scripts:
  type: world
  debug: false
  events:
    on player shoots soul_bow priority:5:
      - if <player.name> != Mergu:
        - ratelimit <player> 1s
        - itemcooldown bow duration:1s
      - determine passively cancelled
      - shoot soul_arrow origin:<player> speed:<context.force> save:arrow no_rotate def:<context.projectile>
      - playsound <player.location> sound:BLOCK_SCULK_CHARGE volume:1 pitch:<util.random.decimal[1.15].to[1.5].add[<context.force.div[10]>]>
      - run soul_bow_particles def:<entry[arrow].shot_entity>|<context.force.div[10]>
    on player shoots block with:soul_arrow:
      - remove <context.projectile>
    on arrow hits entity:
      - if <context.hit_entity.invulnerable>:
        - remove <context.projectile>
      - else if !<context.hit_entity.visible||true> && <context.hit_entity.entity_type> == ARMOR_STAND:
        - remove <context.projectile>

soul_bow_particles:
  type: task
  debug: false
  definitions: arrow|pitch
  script:
    - define spawned <util.time_now>
    - wait 2t
    - while <[arrow].is_spawned||false> && <util.time_now.is_before[<[spawned].add[60s]>]||false>:
      - playeffect <[arrow].location> effect:sculk_soul quantity:<util.random.int[1].to[5]> offset:0,3,0 velocity:0,0,0 visibility:100
      - playsound <[arrow].location> sound:BLOCK_SCULK_SHRIEKER_SHRIEK volume:0.5
      - wait <util.random.int[1].to[3]>t
    - if <[arrow].is_spawned||false>:
      - remove <[arrow]>

soul_arrow:
  type: entity
  debug: false
  entity_type: arrow[damage=0.1;pickup_status=CREATIVE_ONLY;]

keaton_boots:
  type: item
  material: GOLDEN_BOOTS
  Data: 0
  display name: <&6>Keaton Boots
  Lore:
        - <&e>Soft boots made from fur,
        - <&e>They have a strange aura.
  Enchantments:
    - PROTECTION_ENVIRONMENTAL:1
    - DURABILITY:3
    - SOUL_SPEED:3
  mechanisms:
    hides:
      - enchants
  recipes:
      type: shaped
      input:
        - keaton_fur_tuft|air|keaton_fur_tuft
        - keaton_fur_tuft|air|keaton_fur_tuft
keaton_boots_world:
  type: world
  events:
      after player equips keaton_boots:
       - cast speed amplifier:1.0 duration:1639
      after player unequips keaton_boots:
       - cast speed remove
loftwing_cap:
    type: item
    debug: false
    material: leather_helmet
    display name: <&4>Loftwing Cap
    enchantments:
        - luck 1
    mechanisms:
        hides:
            - enchants
    lore:
      - <&c>These feathers have been
      - <&c>fashioned into a nice cap,
      - <&c>you feel lighter!
    recipes:
      type: shaped
      input:
        - enhanced_loftwing_feather|enhanced_loftwing_feather|enhanced_loftwing_feather
        - enhanced_loftwing_feather|air|enhanced_loftwing_feather
loftwing_cap_world:
  type: world
  events:
    after player equips loftwing_cap:
      - cast slow_falling amplifier:1.0 duration:1639 hide_particles
    after player unequips loftwing_cap:
      - cast slow_falling remove

fairy_bow:
  type: item
  debug: false
  material: bow
  data:
    discover: true
  display name: <&color[#00ae24]>Fairy Bow
  enchantments:
    - POWER: 6
    - DURABILITY: 4
  mechanisms:
    custom_model_data: 100

  lore:
    - <&color[#60dc53]>A thing that doesn't change
    - <&color[#60dc53]>with time is a memory
    - <&color[#60dc53]>of younger days.
  recipes:
    1:
      type: shaped
      input:
        - plate_of_courage|deku_root|zc_triforce_gem
        - deku_root|skulltula_silk|air
        - zc_triforce_gem|air|air

fairy_bow_scripts:
  type: world
  debug: false
  events:
    on player shoots fairy_bow priority:5:
      - if <player.name> != Mergu:
        - ratelimit <player> 1s
        - itemcooldown bow duration:1s
      - determine passively cancelled
      - shoot fairy_arrow origin:<player> speed:<context.force> save:arrow no_rotate def:<context.projectile>
      - playsound <player.location> sound:block_amethyst_block_fall volume:1 pitch:<util.random.decimal[1.15].to[1.5].add[<context.force.div[10]>]>
      - run fairy_bow_particles def:<entry[arrow].shot_entity>|<context.force.div[10]>
    on player shoots block with:fairy_arrow:
      - remove <context.projectile>
    on arrow hits entity:
      - if <context.hit_entity.invulnerable>:
        - remove <context.projectile>
      - else if !<context.hit_entity.visible||true> && <context.hit_entity.entity_type> == ARMOR_STAND:
        - remove <context.projectile>

fairy_bow_particles:
  type: task
  debug: false
  definitions: arrow|pitch
  script:
    - define spawned <util.time_now>
    - wait 2t
    - while <[arrow].is_spawned||false> && <util.time_now.is_before[<[spawned].add[60s]>]||false>:
      - playeffect <[arrow].location> effect:totem quantity:<util.random.int[1].to[5]> offset:0,3,0 velocity:0,0,0 visibility:100
      - playsound <[arrow].location> sound:block_amethyst_block_chime pitch:<util.random.decimal[1.2].to[1.8]>
      - wait <util.random.int[1].to[3]>t
    - if <[arrow].is_spawned||false>:
      - remove <[arrow]>

fairy_arrow:
  type: entity
  debug: false
  entity_type: arrow[damage=0.1;pickup_status=CREATIVE_ONLY;]

zc_bomb:
  type: item
  debug: false
  material: slime_ball
  data:
    discover: true
  display name: Bomb
  mechanisms:
    custom_model_data: 100
  lore:
    - Be careful to
    - detonate it on time!
  recipes:
    1:
      type: shaped
      input:
        - tnt|zc_power_dust|tnt
        - zc_power_dust|ink_sac|zc_power_dust
        - tnt|zc_power_dust|tnt

chu_chu_club:
  type: item
  debug: false
  material: wooden_sword
  data:
    discover: true
  display name: <&color[#02d500]>Chu Chu Club
  enchantments:
    - KNOCKBACK: 5
  lore:
    - <&color[#97ff96]>Bonk!

  recipes:
    1:
      type: shaped
      input:
        - chu_chu_jelly
        - chu_chu_jelly
        - stick


diamond_demon_pickaxe:
  type: item
  debug: false
  material: netherite_pickaxe
  data:
    discover: true
  display name: <&color[#a41111]>Diamond Demon Pickaxe
  mechanisms:
    custom_model_data: 300
  lore:
    - <&color[#d92a2a]>It reminds you of
    - <&color[#d92a2a]>the Demon Lord
    - <&color[#d92a2a]>Ghirahim.
  recipes:
    1:
      type: shaped
      input:
        - zc_shard_of_power|zc_shard_of_power|zc_shard_of_power
        - air|netherite_ingot|air
        - air|netherite_ingot|air

diamond_demon_axe:
  type: item
  debug: false
  material: netherite_axe
  data:
    discover: true
  display name: <&color[#a41111]>Diamond Demon Axe
  mechanisms:
    custom_model_data: 300
  lore:
    - <&color[#d92a2a]>Anyone who gets in
    - <&color[#d92a2a]>my way must be
    - <&color[#d92a2a]>dealt with!
  recipes:
    1:
      type: shaped
      input:
        - zc_shard_of_power|zc_shard_of_power|air
        - zc_shard_of_power|netherite_ingot|air
        - air|netherite_ingot|air

diamond_demon_blade:
  type: item
  debug: false
  material: netherite_sword
  data:
    discover: true
  display name: <&color[#a41111]>Diamond Demon Blade
  mechanisms:
    custom_model_data: 600
  lore:
    - <&color[#d92a2a]>Do you have any
    - <&color[#d92a2a]>idea how that makes me
    - <&color[#d92a2a]>feel? Furious! Outraged!
  recipes:
    1:
      type: shaped
      input:
        - air|air|zc_shard_of_power
        - air|zc_shard_of_power|air
        - netherite_ingot|air|air

diamond_demon_shovel:
  type: item
  debug: false
  material: netherite_shovel
  data:
    discover: true
  display name: <&color[#a41111]>Diamond Demon Shovel
  mechanisms:
    custom_model_data: 300
  lore:
    - <&color[#d92a2a]>Left behind by
    - <&color[#d92a2a]>a demon lord
    - <&color[#d92a2a]>on the land below.
  recipes:
    1:
      type: shaped
      input:
        - air|zc_shard_of_power|air
        - air|netherite_ingot|air
        - air|netherite_ingot|air

sword_spirit_blade:
  type: item
  debug: false
  material: diamond_sword
  data:
    discover: true
  display name: <&color[#00aded]>Sword Spirit Blade
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#b4a7d6]>Legend says an ancient
    - <&color[#b4a7d6]>voice resonates inside it.
    - <&color[#b4a7d6]>Can you hear it, Hero?
  recipes:
    1:
      type: shaped
      input:
        - air|gear_of_time|air
        - air|gear_of_time|air
        - air|cured_quartz|air

sword_spirit_shovel:
  type: item
  debug: false
  material: diamond_shovel
  data:
    discover: true
  display name: <&color[#00aded]>Sword Spirit Shovel
  mechanisms:
    custom_model_data: 200
  lore:
    - <&color[#b4a7d6]>Left behind by the
    - <&color[#b4a7d6]>Hero of the Sky, it
    - <&color[#b4a7d6]>was said to grant wishes.
  recipes:
    1:
      type: shaped
      input:
        - air|gear_of_time|air
        - air|cured_quartz|air
        - air|cured_quartz|air

sword_spirit_pickaxe:
  type: item
  debug: false
  material: diamond_pickaxe
  data:
    discover: true
  display name: <&color[#00aded]>Sword Spirit Pickaxe
  mechanisms:
    custom_model_data: 200
  lore:
    - <&color[#b4a7d6]>It is said that
    - <&color[#b4a7d6]>this tool had
    - <&color[#b4a7d6]>magical properties long ago.
  recipes:
    1:
      type: shaped
      input:
        - gear_of_time|gear_of_time|gear_of_time
        - air|cured_quartz|air
        - air|cured_quartz|air

sword_spirit_axe:
  type: item
  debug: false
  material: diamond_axe
  data:
    discover: true
  display name: <&color[#00aded]>Sword Spirit Axe
  mechanisms:
    custom_model_data: 200
  lore:
    - <&color[#b4a7d6]>Lost to time, The blade
    - <&color[#b4a7d6]>allows you to render
    - <&color[#b4a7d6]>your enemies to dust.
  recipes:
    1:
      type: shaped
      input:
        - gear_of_time|gear_of_time|air
        - gear_of_time|cured_quartz|air
        - air|cured_quartz|air

dragon_boots:
  type: item
  debug: false
  material: netherite_boots
  data:
    discover: true
  display name: <&color[#7934AD]>Dragon Boots
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 4
    - PROTECTION_EXPLOSIONS: 3
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#9851CE]>Did we really
    - <&color[#9851CE]>win the war?

dragon_leggings:
  type: item
  debug: false
  material: netherite_leggings
  data:
    discover: true
  display name: <&color[#7934AD]>Dragon Graeves
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 4
    - PROTECTION_EXPLOSIONS: 3
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#9851CE]>People who do not believe in dragons,
    - <&color[#9851CE]>are often eaten by dragons.
  recipes:
    1:
      type: shaped
      input:
        - zc_dragon_scale|zc_dragon_scale|zc_dragon_scale
        - zc_dragon_scale|air|zc_dragon_scale
        - zc_dragon_scale|air|zc_dragon_scale

dragon_chestplate:
  type: item
  debug: false
  material: netherite_chestplate
  data:
    discover: true
  display name: <&color[#7934AD]>Dragon Cuirass
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 4
    - PROTECTION_EXPLOSIONS: 3
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#9851CE]>Come not between the dragon
    - <&color[#9851CE]>and her wrath.
  recipes:
    1:
      type: shaped
      input:
        - zc_dragon_scale|air|zc_dragon_scale
        - zc_dragon_scale|zc_dragon_scale|zc_dragon_scale
        - zc_dragon_scale|zc_dragon_scale|zc_dragon_scale

dragon_helmet:
  type: item
  debug: false
  material: netherite_helmet
  data:
    discover: true
  display name: <&color[#7934AD]>Dragon Helmet
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 4
    - PROTECTION_EXPLOSIONS: 3
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#9851CE]>Here are dragons to be slain,
    - <&color[#9851CE]>and treasures to be gain.
  recipes:
    1:
      type: shaped
      input:
        - zc_dragon_scale|zc_dragon_scale|zc_dragon_scale
        - zc_dragon_scale|air|zc_dragon_scale

mythril_dragon_boots:
  type: item
  debug: false
  material: netherite_boots
  data:
    discover: true
  display name: <&color[#5187CE]>Frozen Drake Boots
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 6
    - PROTECTION_EXPLOSIONS: 5
    - PROTECTION_FIRE: 5
  mechanisms:
    custom_model_data: 600
  lore:
    - <&color[#79A6E2]>War never really changes.
  recipes:
    1:
      type: shaped
      input:
        - mythril_dragon_scale|air|mythril_dragon_scale
        - mythril_dragon_scale|air|mythril_dragon_scale

mythril_dragon_leggings:
  type: item
  debug: false
  material: netherite_leggings
  data:
    discover: true
  display name: <&color[#5187CE]>Frozen Drake Graeves
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 6
    - PROTECTION_EXPLOSIONS: 5
    - PROTECTION_FIRE: 5
  mechanisms:
    custom_model_data: 600
  lore:
    - <&color[#79A6E2]>Never anger the beast that
    - <&color[#79A6E2]>sleeps at the end of the world.
  recipes:
    1:
      type: shaped
      input:
        - mythril_dragon_scale|mythril_dragon_scale|mythril_dragon_scale
        - mythril_dragon_scale|air|mythril_dragon_scale
        - mythril_dragon_scale|air|mythril_dragon_scale

mythril_dragon_chestplate:
  type: item
  debug: false
  material: netherite_chestplate
  data:
    discover: true
  display name: <&color[#5187CE]>Frozen Drake Cuirass
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 6
    - PROTECTION_EXPLOSIONS: 5
    - PROTECTION_FIRE: 5
  mechanisms:
    custom_model_data: 600
  lore:
    - <&color[#79A6E2]>So comes snow after fire,
    - <&color[#79A6E2]>and even dragons have their endings.
  recipes:
    1:
      type: shaped
      input:
        - mythril_dragon_scale|air|mythril_dragon_scale
        - mythril_dragon_scale|mythril_dragon_scale|mythril_dragon_scale
        - mythril_dragon_scale|mythril_dragon_scale|mythril_dragon_scale

mythril_dragon_helmet:
  type: item
  debug: false
  material: netherite_helmet
  data:
    discover: true
  display name: <&color[#5187CE]>Frozen Drake Helmet
  enchantments:
    - PROTECTION_ENVIRONMENTAL: 6
    - PROTECTION_EXPLOSIONS: 5
    - PROTECTION_FIRE: 5
  mechanisms:
    custom_model_data: 600
  lore:
    - <&color[#79A6E2]>Death comes out
    - <&color[#79A6E2]>of the dragons mouth.
  recipes:
    1:
      type: shaped
      input:
        - mythril_dragon_scale|mythril_dragon_scale|mythril_dragon_scale
        - mythril_dragon_scale|air|mythril_dragon_scale

mythril_longbow:
  type: item
  debug: false
  material: bow
  data:
    discover: true
  display name: <&color[#6FB3D4]>Mythril Longbow
  enchantments:
    - ARROW_DAMAGE: 6
  mechanisms:
    custom_model_data: 800
  lore:
    - <&color[#97CEE8]>Fragments of mythril
    - <&color[#97CEE8]>form this sturdy bow.
  recipes:
    1:
      type: shaped
      input:
        - air|zc_mythril|reinforced_string
        - zc_mythril|air|reinforced_string
        - air|zc_mythril|reinforced_string

blin_basher:
  type: item
  debug: false
  material: netherite_pickaxe
  data:
    discover: true
  display name: <&color[#57009a]>Blin Basher
  enchantments:
    - DIG_SPEED: 5
    - KNOCKBACK: 5
  mechanisms:
    custom_model_data: 800
  lore:
    - <empty>
    - <&color[#6d00c1]>A hammer made from Bokoblin Horns.
    - <&color[#6d00c1]>Smash and Crash!
  recipes:
    1:
      type: shaped
      input:
        - bokoblin_horn|obsidian_plate|crying_obsidian
        - air|amethyst_shard|obsidian_plate
        - moblin_fang|air|bokoblin_horn

decaying_hoe:
  type: item
  debug: false
  material: iron_hoe
  data:
    discover: true
  display name: <&color[#E2BE45]>Decaying Hoe
  mechanisms:
    custom_model_data: 800
  enchantments:
    - LOOT_BONUS_BLOCKS: 4
  lore:
    - <empty>
    - <&color[#D8C565]>The decaying remains of a Moblin,
    - <&color[#C28B72]>fashioned into a crude hoe.
    - <&color[#A03485]>The smell is putrid.
  recipes:
    1:
      type: shaped
      input:
        - moblin_horn|moblin_horn|large_amethyst_bud
        - air|raw_gold_block|moblin_fang
        - obsidian_plate|raw_gold_block|air

moblin_axe:
  type: item
  debug: false
  material: golden_axe
  data:
    discover: true
  display name: <&color[#E2BE45]>Spiked Boko Axe
  mechanisms:
    custom_model_data: 600
  enchantments:
    - DAMAGE_UNDEAD: 6
  lore:
    - <empty>
    - <&color[#C28B72]>Spiked thorns and teeth
    - <&color[#C28B72]>rip flesh from bone.
  recipes:
    1:
      type: shaped
      input:
        - moblin_fang|moblin_horn|bokoblin_guts
        - air|moblin_fang|air
        - obsidian_plate|stick|air

moblin_pickaxe:
  type: item
  debug: false
  material: golden_pickaxe
  data:
    discover: true
  display name: <&color[#349EA0]>Molblin Pickaxe
  mechanisms:
    custom_model_data: 600
  enchantments:
    - DIG_SPEED: 5
    - LOOT_BONUS_BLOCKS: 4
    - DAMAGE_UNDEAD: 3
  lore:
    - <empty>
    - <&color[#42BEDF]>A pickaxe fashioned from those,
    - <&color[#42C8D8]>who deal with the Prince of Darkness.
  recipes:
    1:
      type: shaped
      input:
        - moblin_horn|moblin_guts|moblin_guts
        - air|onox_shard|moblin_guts
        - netherite_ingot|air|moblin_horn

time_lord_blade:
  type: item
  debug: false
  material: diamond_sword
  data:
    discover: true
  display name: <&b>Time <&3>Lord <&a>Blade
  mechanisms:
    custom_model_data: 800
  enchantments:
    - DAMAGE_ALL: 5
    - MENDING
  lore:
    - <&color[#42C8D8]>Fragments of the legendary
    - <&color[#42C8D8]>blade of a Fierce Deity.
  recipes:
    1:
      type: shaped
      input:
        - air|gear_of_time|air
        - air|timestone_shard|air
        - air|zc_mythril_hilt|air

time_lord_shovel:
  type: item
  debug: false
  material: diamond_shovel
  data:
    discover: true
  display name: <&b>Time <&3>Lord <&a>Shovel
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#42C8D8]>Dig deep into
    - <&color[#42C8D8]>memories of a falseborn world.
  recipes:
    1:
      type: shaped
      input:
        - air|timestone_shard|air
        - air|cured_quartz_plate|air
        - air|tempered_iron_plate|air

time_lord_pickaxe:
  type: item
  debug: false
  material: diamond_pickaxe
  data:
    discover: true
  display name: <&b>Time <&3>Lord <&a>Pickaxe
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#42C8D8]>Forge your way
    - <&color[#42C8D8]>into your own creation,
    - <&color[#42C8D8]>avoid a terrible fate.
  recipes:
    1:
      type: shaped
      input:
        - timestone_shard|gear_of_time|timestone_shard
        - air|cured_quartz_plate|air
        - air|tempered_iron_plate|air

time_lord_axe:
  type: item
  debug: false
  material: diamond_axe
  data:
    discover: true
  display name: <&b>Time <&3>Lord <&a>Axe
  mechanisms:
    custom_model_data: 500
  lore:
    - <&color[#42C8D8]>A haunting axe
    - <&color[#42C8D8]>found deep within the
    - <&color[#42C8D8]> forgotten land of Termina.
  recipes:
    1:
      type: shaped
      input:
        - gear_of_time|timestone_shard|air
        - timestone_shard|cured_quartz_plate|air
        - air|tempered_iron_plate|air

warden_boots:
  type: item
  debug: false
  material: leather_boots
  data:
    discover: true
  display name: <&color[#1697AF]>Warden Boots
  mechanisms:
    color: 41,223,235
    custom_model_data: 200
    attribute_modifiers:
      generic_armor:
        1:
          operation: add_number
          amount: 4
          slot: feet
      generic_armor_toughness:
        1:
          operation: add_number
          amount: 3
          slot: feet
  enchantments:
    - DURABILITY: 6
    - SOUL_SPEED: 5
  lore:
    - <&b>Pulsating lights swirl
    - <&b>from the depths below.
  recipes:
    1:
      type: shaped
      input:
        - fragmented_sculk|air|fragmented_sculk
        - malice_fragment|air|malice_fragment

warden_chestplate:
  type: item
  debug: false
  material: leather_chestplate
  data:
    discover: true
  display name: <&color[#1697AF]>Warden Chestplate
  mechanisms:
    color: 41,223,235
    custom_model_data: 300
    attribute_modifiers:
      generic_armor:
        1:
          operation: add_number
          amount: 9
          slot: chest
      generic_armor_toughness:
        1:
          operation: add_number
          amount: 3
          slot: chest
  enchantments:
    - DURABILITY: 6
  lore:
    - <&b>Otherwordly heartbeats thrum
    - <&b>within a cracked ribcage.
  recipes:
    1:
      type: shaped
      input:
        - fragmented_sculk|air|fragmented_sculk
        - fragmented_sculk|malice_fragment|fragmented_sculk
        - fragmented_sculk|fragmented_sculk|fragmented_sculk

warden_helmet:
  type: item
  debug: false
  material: leather_helmet
  data:
    discover: true
  display name: <&color[#1697AF]>Warden Helmet
  mechanisms:
    color: 41,223,235
    custom_model_data: 100
    attribute_modifiers:
      generic_armor:
        1:
          operation: add_number
          amount: 4
          slot: head
      generic_armor_toughness:
        1:
          operation: add_number
          amount: 3
          slot: head
  enchantments:
    - DURABILITY: 6
  lore:
    - <&b>Beneath this hollow husk
    - <&b>lay spirits clouded in shadow.
  recipes:
    1:
      type: shaped
      input:
        - fragmented_sculk|fragmented_sculk|fragmented_sculk
        - malice_fragment|air|malice_fragment

warden_leggings:
  type: item
  debug: false
  material: leather_leggings
  data:
    discover: true
  display name: <&color[#1697AF]>Warden Leggings
  mechanisms:
    color: 41,223,235
    custom_model_data: 200
    attribute_modifiers:
      generic_armor:
        1:
          operation: add_number
          amount: 7
          slot: legs
      generic_armor_toughness:
        1:
          operation: add_number
          amount: 3
          slot: legs
  enchantments:
    - DURABILITY: 6
  lore:
    - <&b>Tread softly within the darkness,
    - <&b>whispering souls cry out.
  recipes:
    1:
      type: shaped
      input:
        - fragmented_sculk|fragmented_sculk|fragmented_sculk
        - malice_fragment|air|malice_fragment
        - fragmented_sculk|air|fragmented_sculk

knight_bow:
  type: item
  debug: false
  material: bow
  data:
    discover: true
  display name: <&color[#999999]>Knights Bow
  mechanisms:
      custom_model_data: 200
  enchantments:
    - ARROW_DAMAGE: 3
  lore:
  - <&7>The sturdy metal construction of
  - <&7>this bow offers superior durability.
  recipes:
    1:
      type: shaped
      input:
        - air|tempered_iron_plate|skultulla_silk
        - plate_of_wisdom|air|skultulla_silk
        - air|tempered_iron_plate|skultulla_silk

royal_guard_bow:
  type: item
  debug: false
  material: bow
  data:
    discover: true
  display name: <&color[#A00063]>Royal Guard's Bow
  mechanisms:
      custom_model_data: 400
      hides: attributes
      attribute_modifiers:
        generic_attack_speed:
          1:
            operation: add_number
            amount: 1
            slot: hand
  enchantments:
    - ARROW_DAMAGE: 5
  lore:
  - <&color[#C63D92]>Made with ancient technology,
  - <&color[#C63D92]>it boasts a high rate of firepower
  - <&color[#C63D92]>but has low durability.
  recipes:
    1:
      type: shaped
      input:
        - air|netherite_ingot|onox_shard
        - obsidian_plate|air|reinforced_string
        - air|netherite_ingot|onox_shard

heros_bow:
  type: item
  debug: false
  material: bow
  data:
    discover: true
  display name: <&e>Hero's Bow
  mechanisms:
      custom_model_data: 300
  enchantments:
    - ARROW_DAMAGE: 3
    - DURABILITY: 3
  lore:
  - <&6>A replica of the bow said
  - <&6>to be used in the Era of Twilight.
  recipes:
    1:
      type: shaped
      input:
        - air|stick|gold_skultulla_silk
        - plate_of_courage|air|gold_skultulla_silk
        - air|stick|gold_skultulla_silk

warden_helmet_world:
  type: world
  events:
      after player equips warden_helmet:
       - playsound <player.location> sound:entity_warden_tendril_clicks volume:1.5
       - playsound <player.location> sound:entity_warden_heartbeat volume:1.5
      on delta time secondly:
        - foreach <server.online_players.filter[has_equipped[warden_helmet]]> as:__player:
          - playeffect effect:white_ash quantity:<util.random.int[1].to[5]> at:<player.location>
warden_chestplate_world:
  type: world
  events:
      after player equips warden_chestplate:
       - playsound <player.location> sound:entity_warden_tendril_clicks volume:1.5
      on delta time secondly:
        - foreach <server.online_players.filter[has_equipped[warden_chestplate]]> as:__player:
          - playeffect effect:sculk_soul quantity:<util.random.int[1].to[5]> at:<player.location>
          - playsound <player.location> sound:entity_warden_heartbeat volume:1.5
warden_boots_world:
  type: world
  events:
      after player equips warden_boots:
       - playsound <player.location> sound:entity_warden_tendril_clicks volume:1.5
       - playsound <player.location> sound:entity_warden_heartbeat volume:1.5
      on delta time secondly:
        - foreach <server.online_players.filter[has_equipped[warden_boots]]> as:__player:
          - playeffect effect:sculk_charge quantity:<util.random.int[1].to[5]> at:<player.location>
warden_leggings_world:
  type: world
  events:
      after player equips warden_leggings:
       - playsound <player.location> sound:entity_warden_tendril_clicks volume:1.5
       - playsound <player.location> sound:entity_warden_heartbeat volume:1.5
      on delta time secondly:
        - foreach <server.online_players.filter[has_equipped[warden_leggings]]> as:__player:
          - playeffect effect:white_ash quantity:<util.random.int[1].to[5]> at:<player.location>