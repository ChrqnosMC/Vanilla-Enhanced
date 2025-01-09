import { writeFile, mkdir } from 'fs/promises'

const trims = [
  'sentry',
  'vex',
  'wild',
  'coast',
  'dune',
  'wayfinder',
  'raiser',
  'shaper',
  'host',
  'ward',
  'silence',
  'tide',
  'snout',
  'rib',
  'eye',
  'spire',
  'flow',
  'bolt'
]

const tools = [
  'netherite_axe',
  'diamond_axe',
  'golden_axe',
  'iron_axe',
  'stone_axe',
  'wooden_axe',
  'netherite_pickaxe',
  'diamond_pickaxe',
  'golden_pickaxe',
  'iron_pickaxe',
  'stone_pickaxe',
  'wooden_pickaxe',
  'netherite_shovel',
  'diamond_shovel',
  'golden_shovel',
  'iron_shovel',
  'stone_shovel',
  'wooden_shovel',
  'netherite_hoe',
  'diamond_hoe',
  'golden_hoe',
  'iron_hoe',
  'stone_hoe',
  'wooden_hoe',
  'netherite_sword',
  'diamond_sword',
  'golden_sword',
  'iron_sword',
  'stone_sword',
  'wooden_sword'
]

const items = {
  quartz: 'quartz',
  iron: 'iron_ingot',
  netherite: 'netherite_ingot',
  redstone: 'redstone',
  copper: 'copper_ingot',
  gold: 'gold_ingot',
  emerald: 'emerald',
  diamond: 'diamond',
  lapis: 'lapis_lazuli',
  amethyst: 'amethyst_shard',
  // index >= 10
  armadillo_scute: 'armadillo_scute',
  blaze_rod: 'blaze_rod',
  bone: 'bone',
  breeze_rod: 'breeze_rod',
  coal: 'coal',
  dragon_breath: 'dragon_breath',
  echo_shard: 'echo_shard',
  end_crystal: 'end_crystal',
  ender_pearl: 'ender_pearl',
  experience_bottle: 'experience_bottle',
  fire_charge: 'fire_charge',
  glow_ink: 'glow_ink_sac',
  glowstone: 'glowstone_dust',
  gunpowder: 'gunpowder',
  heart_of_the_sea: 'heart_of_the_sea',
  honeycomb: 'honeycomb',
  leather: 'leather',
  nautilus: 'nautilus_shell',
  nether_brick: 'nether_brick',
  nether_star: 'nether_star',
  netherite_scrap: 'netherite_scrap',
  phantom_membrane: 'phantom_membrane',
  prismarine_crystals: 'prismarine_crystals',
  prismarine: 'prismarine_shard',
  purpur: 'popped_chorus_fruit',
  rabbit_hide: 'rabbit_hide',
  slime: 'slime_ball',
  turtle_scute: 'turtle_scute'
}

function compareMaterial(material1: string, material2: string) {
  if (material1.startsWith('gold') && material2.startsWith('gold')) return true
  return material1 === material2
}

async function promiseAllInBatches(items: (()=>Promise<void>)[], batchSize: number) {
  let position = 0
  while (position < items.length) {
      const itemsForBatch = items.slice(position, position + batchSize)
      await Promise.all(itemsForBatch.map(item => item()))
      position += batchSize
  }
}

async function writeItemRecipes() {
  const promises: (()=>Promise<void>)[] = []

  await mkdir(`./generator/output/data/vanilla_enhanced/recipe`, { recursive: true })

  for (const tool of tools) {
    let [toolMaterial, toolName] = tool.split('_')
    
    let modelDataIndex = 1

    if (!toolName) {
      toolName = toolMaterial
      toolMaterial = ''
    }

    for (const [materialIndex, [material]] of Object.entries(items).entries()) {
      for (const trim of trims) {
        const isSameMaterial = compareMaterial(material, toolMaterial)

        const recipeFile = isSameMaterial
          ? `./generator/output/data/vanilla_enhanced/recipe/${tool}_smithing_from_${trim}_and_${material}_darker.json`
          : `./generator/output/data/vanilla_enhanced/recipe/${tool}_smithing_from_${trim}_and_${material}.json`
        const recipeContents = {
          type: 'minecraft:smithing_transform',
          addition: `minecraft:${items[material]}`,
          base: `minecraft:${tool}`,
          result: {
            count: 1,
            id: `minecraft:${tool}`,
            components: {
              'minecraft:custom_model_data': modelDataIndex++,
              'minecraft:trim': {
                material: materialIndex < 10 ? `minecraft:${material}` : `vanilla_enhanced:${material}`,
                pattern: `minecraft:${trim}`
              }
            }
          },
          template: `minecraft:${trim}_armor_trim_smithing_template`
        }

        promises.push(()=>writeFile(recipeFile, JSON.stringify(recipeContents, null, 2)))
      }
    }
  }

  return promiseAllInBatches(promises, 100)
}

writeItemRecipes()
