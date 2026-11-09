# लडबड · Ladbad

A pass-the-phone Nepali gibberish game. Read silly English out loud ("Ill Lamb Bug Jar") until your ears hear the Nepali hiding inside (इलाम बजार).

- Two teams, one phone. Warm-up → Slippery → Brain melt → Boss round (ukhaan).
- Hints cost points. Miss a card and the other team gets one guess to steal.
- Full English / नेपाली toggle, so parents and kids can play together.
- 95 cards: places, food, festivals, things heard at home, songs, ukhaan.

## Run it

Open `index.html` in any browser, or host it on GitHub Pages.

## Edit it

`ladbad.html` is the source. The deck is the `DECK` array at the top of the script:
`[decoy, romanised answer, नेपाली answer, meaning, category, tier]`.
After editing, run `./build.sh` to regenerate `index.html`.
