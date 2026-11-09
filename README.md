# लडबड · Ladbad

A Nepali gibberish party game for phones. Read silly English out loud ("Ill Lamb Bug Jar") until your ears hear the Nepali hiding inside (इलाम बजार).

It plays like a real card game: the reader holds the front of the card, everyone else sees the back.

## How a game works

1. One person taps **Start a room** and shares the 4-letter code (or the Invite link).
2. Everyone else opens Ladbad on their own phone and taps **Join a room**. New phones are put on the smaller team; tap a team to switch.
3. Teams take turns. Each turn one player is the reader:
   - the **reader's phone** shows only the gibberish, a timer, Hint and Pass;
   - **every other phone** shows the answer in नेपाली, romanised and in English;
   - the **other team** taps **Got it!** when the reader says it.
4. The host picks **categories** (Places, Food, Festivals, Heard at home, Everyday talk, Family, Ukhaan, Songs & movies) and a **difficulty**: Easy to hard, Hard, or Impossible.
5. Cards go Warm-up → Slippery → Brain melt → Boss round → **Impossible** (decoys that read like real English sentences). Hints cost points.

Also: full English / नेपाली switch (with Nepali numerals), a solo Practice mode, and 166 cards.

## How phones connect

Supabase Realtime (broadcast + presence) on the `akabare-panipuri` project, channel `ladbad-<CODE>`. No database tables are used.
The phone that starts the room is the host: it holds the game state, applies every action and broadcasts the state; other phones only send actions.

- A reader whose phone drops for 8 seconds passes the turn to the next person on their team.
- If a team has nobody left in the room, the game waits for them; the host can end the game.
- The host phone can reload mid-game and pick up where it left off. If it leaves, everyone is sent home.

Note: Supabase free projects pause after about a week without use. If rooms stop connecting, un-pause the project in the Supabase dashboard.

## Edit it

`ladbad.html` is the source. The deck is the `DECK` array: `[decoy, romanised answer, नेपाली answer, meaning, category, tier]` (tier 0-4, 4 = Impossible). Add new cards at the end so saved play history stays valid.
After editing, run `./build.sh` to regenerate `index.html`.

To test several "phones" in one browser, add `?p=anything` to the URL; each value gets its own identity.
