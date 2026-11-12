# लडबड · Ladbad

A Nepali gibberish party game for phones. Read silly English out loud ("Ill Lamb Bug Jar") until your ears hear the Nepali hiding inside (इलाम बजार).

It plays like a real card game: the reader holds the front of the card, everyone else sees the back.

## Links

- Play: https://ladbad.tumlet.com
- Practice alone: https://ladbad.tumlet.com/practice/

The site is hosted on Netlify, which serves this repo's `main` branch, so pushing to `main` updates it.

## How a game works

1. One person taps **Start a room** and shares the 4-letter code (or the Invite link).
2. Everyone else opens Ladbad on their own phone and taps **Join a room**. New phones are put on the smaller team; tap a team to switch.
3. Teams take turns. Each turn one player is the reader:
   - the **reader's phone** shows only the gibberish, a timer, Hint and Pass;
   - **every other phone** shows the answer in नेपाली, romanised and in English;
   - the **other team** taps **Got it!** when the reader says it.
4. No settings to pick: each team gets 10 cards, 20 seconds a card, from all categories. Cards come in pairs from the same tier, one for each team, so both teams climb the same ladder from easy to hard.
5. Cards go Warm-up → Slippery → Brain melt → Boss round → **Impossible** (decoys that read like real English sentences). Hints cost points.

Also: full English / नेपाली switch (with Nepali numerals), a solo Practice mode, and 165 cards.

## How phones connect

Supabase Realtime (broadcast + presence) on the `akabare-panipuri` project, channel `ladbad-<CODE>`. No database tables are used.
The phone that starts the room is the host: it holds the game state, applies every action and broadcasts the state; other phones only send actions.

- A reader whose phone drops for 8 seconds passes the turn to the next person on their team.
- If a team has nobody left in the room, the game waits for them; the host can end the game.
- The host phone can reload mid-game and pick up where it left off. If it leaves, everyone is sent home.

Note: Supabase free projects pause after about a week without use. If rooms stop connecting, un-pause the project in the Supabase dashboard.

## Card votes

Each card has 👍 and 👎 buttons inside it: on the result card after each turn, and on the card in Practice. Each phone gets one vote per card; tapping the other button changes it. In the database a 👍 counts as a "love" and a 👎 as a "whack".

Votes go to the `ladbad_votes` table in the `akabare-panipuri` Supabase project, through the `ladbad_vote()` function only. The public key cannot read votes.

To see the best and worst prompts, open the Supabase dashboard → Table Editor → `ladbad_card_scores`. It lists every card with the players' votes next to Claude's own ratings (`claude_fun`, `claude_difficulty`, `claude_sound`, `claude_weird`, `claude_seconds`, `claude_note`). Claude's ratings live in `ladbad_card_ratings`. Or run in the SQL editor:

```sql
select decoy, answer, loves, whacks, score, love_pct from ladbad_card_scores;            -- best first
select decoy, answer, loves, whacks, score from ladbad_card_scores order by score asc;   -- the whackest
```

## Analytics

Google Analytics (measurement ID `G-RBBW0WK1B4`) is added by `build.sh` in the page head. It does not load on localhost, so local testing is not counted.

## Edit it

**Before writing new cards, read [CARDS.md](CARDS.md).** It has the card-writing rules learned from the votes, plus the Love it and Whack lists.

`ladbad.html` is the source. The deck is the `DECK` array: `[decoy, romanised answer, नेपाली answer, meaning, category, tier]` (tier 0-4, 4 = Impossible). Add new cards at the end. Removing a card only reshuffles which cards count as "already played" for a while, which does no harm. Also add each new card to `ladbad_card_ratings`; a card missing from that table shows as `retired` in `ladbad_card_scores`.
After editing, run `./build.sh` to regenerate `index.html`.

To test several "phones" in one browser, add `?p=anything` to the URL; each value gets its own identity.
