# Equilinox

## Where is the options page?

This is not a core-supported game, so there is not options page. You can create a yaml file using the Archipelago Options creator.

### `goal_selection`:

Currently, there are two possible goal conditions: 

| Option      | Description |
| ----------- | ----------- |
| `evolve_camel` | Evolve a Camel |
| `completionist` | Complete every task |

Recommendations for additional goal conditions are welcome.

### `free_evolution`:
Default: `true`.

If `true`, starting an evolution costs 0 DP. The other requirements must still be met. If `false`, the vanilla behavior remains (charging DP to start an evolution).

### `tasks_reward_dp`:
Default: `true`.

If `true`, tasks will give their normal DP amount upon completion, in addition to sending a check. If `false`, completing tasks just sends a check, and some of the small
filler DP items are replaced with larger DP items.

### `starting_dp`:
Default: `5000`.
Range: `2500` - `100000`.

The vanilla default starting amount is 2,500 DP. The actual starting DP value will be close to the value of this setting, but not exact.

### `itempool_dp`:
Default: `150000`.
Range: `0` - `500000`.

Can be used to add additional large DP items to the item pool. As with `starting_dp`, the actual value of the added DP items will be close to this, but not exact.

### `size_checks`:
Default: `true`.

Include checks for breeding species of size 1.10 and size 1.20. Adds 288 checks (or 286 if `evolve_camel` is the goal).

## What is the goal condition?

See YAML options above for a description of the possible goal conditions.

## What items could appear in other worlds?

Currently, there are only two types of items. All of the base species need to be unlocked by an item (eg, "Sheep Permit" to unlock the sheep), and DP can be received in varying amounts (100 - 100,000). 
Filler DP items range from 100dp to 10,000dp, with amounts around 1,000 most common. Suggestions for additional items / item types are welcome.

## What do location checks look like?

Currently, there are two types of checks that are always included:

<ul>
  <li>
    Task Checks - each task sends a check upon completion (60 checks, or 59 if "Completionist" is the goal)
  </li>
  <li>
    Evolution Checks - evolving a species for the first time sends a check (107 checks, or 106 if "Camel" is the goal)
  </li>
</ul>

In the yaml, you have the option to turn on additional checks:

<ul>
  <li>Size Checks - breeding a species of size 1.10 is a check, and breeding a species of size 1.20 is a check, for each species (288 checks, or 286 if "Camel" is the goal)</li>
</ul>

Additional optional checks planned but not yet implemented: 

<ul>
  <li>More trait checks</li>
  <li>Biome checks</li>
  <li>Species count checks</li>
</ul>
