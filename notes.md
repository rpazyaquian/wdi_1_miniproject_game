# Mini Project: Character Generator and Game

Right now, I'm thinking of something like this:

* We have a Character object.
* It has these attributes:
  * Name (@name).
  * Role (@role) (i.e. character class).
  * Race (@race).
  * Level (@level).
  * Stats (@stats).
* Actually, no, now that I think about it... I don't want to force any user to conform to a specific set of fields/rules. What if a game has nothing but human characters? Then the Race field is redundant. What if the game doesn't use Roles? Then there's no point in it existing. Maybe I'll leave that all up to the user and make something like this instead:
  * Name, so you can at least identify a character.
  * Fields, to hold everything such as Race, Role, Level, Stats. Referring to these fields as `Character.fields[level]` is a lot more annoying than `Character.level`, though...
* It has these methods:
  * You create a new Character by calling Character#new.
    * Calling Character#new with no parameters generates a completely random character.
      * e.g. calling Character#new gives you a character of random name, role, race, stats, etc.
    * Calling Character#new with parameters generates the requested character.
      * e.g. Character.new({ name: "Harry", role: "Wizard", race: "Human", stats: {?} }) gives you Harry.
    * All Characters are generated with a Level of 1.
* More will come!

On a grander scale:

Each Game has a Ruleset that governs the @stats, @race, @class, etc. of each Character. Each Character belongs to a party. Or something.