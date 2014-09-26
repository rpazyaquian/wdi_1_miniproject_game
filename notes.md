# Mini Project: Character Generator and Game

Right now, I'm thinking of something like this:

* We have a Character object.
* It has these attributes:
  * Name (@name).
  * Class (@class).
  * Race (@race).
  * Level (@level).
  * Stats (@stats).
* It has these methods:
  * You create a new Character by calling Character#new.
    * Calling Character#new with no parameters generates a completely random character.
      * e.g. calling Character#new gives you a character of random name, class, race, stats, etc.
    * Calling Character#new with parameters generates the requested character.
      * e.g. Character.new({ name: "Harry", class: "Wizard", race: "Human", stats: {?} }) gives you Harry.
    * All Characters are generated with a Level of 1.
* More will come!

On a grander scale:

Each Game has a Ruleset that governs the @stats, @race, @class, etc. of each Character. Each Character belongs to a party. Or something.