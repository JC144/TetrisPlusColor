# Tetris Plus - GBC Homebrew
## Last release
[v1.0](https://github.com/JC144/TetrisPlusColor/releases/tag/Release)

## Why?
I loved this game on PSX. I recently bought a Game Boy Color and discovered a Game Boy version of it... but in grey.

It's 2026, we have AI, can it be used to fix this?

I found the ROM, decompiled it using RGBDS, and innocently asked my friend Claude to add some color to it (fun fact: I'm colorblind).

It didn't work. All the memory references were hardcoded.

Well, maybe it could fix that. We started a refactor and after a few nights, the code was commented and labelled, references were now relative. We could modify the code.

We built tools, exported screen, Claude learned to play Tetris, two steps forward, one step back. We could get colors but the palette was the same on every screen. Then the colors got fixed, only for the moving pieces to change color at every step...
I read the Game Boy documentation, learned how it worked, talked it over with Claude, we tried new things. 

However, it was getting too time consuming and I set the project aside.

Then came Fable. The legendary Fable.
"Can you color this game?"
"Yes of course... Oh wait, some stuff is broken, let me fix it, oh I can improve that, hmm, let me build a new tool, ..." tippeting, fidgeting, higitus, figitus, I had a colored Tetris game.

We then built a better editor to fix a few last tiles.

The big part was done, the game still needed some little fixes to be nice to play:
* Adding a mecanism to skip the first license screen (I lost days watching it!)
* Fixing that "LICENSED TO N*TENDO" taking up a third of the start screen
* Switching Continue to New Game to avoid misclicks for player in an hurry
* Fixing the end game where the background elements were falling appart

I'm proud of the result and I enjoyed it a lot!

## Contribution
If you want to contribute and modify some levels, there are already some tools available in the ./tools folder.

Feel free to open a PR. Sadly, I've always struggle to draw things and I'm not good with colors.