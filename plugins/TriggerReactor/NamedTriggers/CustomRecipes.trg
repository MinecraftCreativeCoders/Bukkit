/// <Summary>
/// This is a test script for the TriggerReactor plugin.
/// </Summary>
import org.bukkit.Bukkit
import org.bukkit.inventory.ShapedRecipe
import org.bukkit.inventory.RecipeChoice$ExactChoice
import org.bukkit.Material
import org.bukkit.NamespacedKey
import org.bukkit.inventory.ItemStack

//Reset the recipe list
plugin = plugin("TriggerReactor")
recipes = Bukkit.recipeIterator()
WHILE recipes.hasNext()
    rec = recipes.next()
    IF rec.getKey().getNamespace().equals(plugin.getName().toLowerCase())
        Bukkit.removeRecipe(rec.getKey());
    ENDIF
ENDWHILE


//Create a new recipes
///////////////////////////

// Example recipe
// This is a recipe that turns 9 diamonds into 1 "Emerald?"

// key = NamespacedKey(plugin, "Diamond_to_Emerald");

// result = item("EMERALD", 9)
// setItemTitle(result, "&bEmerald?");

// recipe = ShapedRecipe(key, result);
// recipe.shape("   ", " D ", "   ");

// ingredientKeys = "D"
// recipe.setIngredient(ingredientKeys.charAt(0), ExactChoice(ItemStack(Material.DIAMOND, 1)));

// Bukkit.addRecipe(recipe);
// #LOG "Loaded '"+recipe.getKey().toString()+"'!";

//Register all recipes
#LOG "All recipes loaded!"