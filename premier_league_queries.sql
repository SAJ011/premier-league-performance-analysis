/* ============================================================
   PREMIER LEAGUE TEAM EFFICIENCY ANALYSIS — SQL Query Report
   Season: 2022/23
   Dataset: standings
   Key fields: team_id, team_name, points, matches_played, wins,
               goals_for, goals_against, home, home_wins, away, away_wins
   NOTE: reconstructed and cleaned from the original SSMS screenshots
   in Football_Query_Report_Portfolio.pdf — sanity-check column names
   against your original script before committing.
   ============================================================ */


-- KPI 1: Points Per Match
-- Normalises points across teams regardless of fixtures played.
SELECT
    team_id,
    team_name,
    points,
    matches_played,
    CAST((points * 1.0) / matches_played AS DECIMAL(10,2)) AS points_per_match
FROM standings
ORDER BY points_per_match DESC;


-- KPI 2: Win Rate
-- Win percentage; a rate above ~55% strongly correlates with a top-4 finish.
SELECT
    team_id,
    team_name,
    wins,
    matches_played,
    CAST((wins * 1.0 / matches_played) * 100 AS DECIMAL(10,2)) AS win_rate
FROM standings
ORDER BY win_rate DESC;


-- KPI 3: Goals Scored Per Match
-- Attacking output; correlates strongly with final points total.
SELECT
    team_id,
    team_name,
    goals_for,
    matches_played,
    CAST((goals_for * 1.0) / matches_played AS DECIMAL(10,2)) AS goals_per_match
FROM standings
ORDER BY goals_per_match DESC;


-- KPI 4: Goals Conceded Per Match
-- Defensive efficiency; separates title contenders from mid-table sides more than attack alone.
SELECT
    team_id,
    team_name,
    goals_against,
    matches_played,
    CAST((goals_against * 1.0) / matches_played AS DECIMAL(10,2)) AS goals_conceded_per_match
FROM standings
ORDER BY goals_conceded_per_match ASC;


-- KPI 5: Home Win Rate
-- Home advantage — top clubs convert >65% of home fixtures into wins.
SELECT
    team_id,
    team_name,
    home_wins,
    home,
    CAST((home_wins * 1.0 / home) * 100 AS DECIMAL(10,2)) AS home_win_percentage
FROM standings
ORDER BY home_win_percentage DESC;


-- KPI 6: Away Win Rate
-- The sharpest differentiator between elite and mid-table clubs — reflects squad depth and tactical flexibility.
SELECT
    team_id,
    team_name,
    away_wins,
    away,
    CAST((away_wins * 1.0 / away) * 100 AS DECIMAL(10,2)) AS away_win_percentage
FROM standings
ORDER BY away_win_percentage DESC;


/* ============================================================
   SUMMARY
   - Points per match and win rate are the most reliable indicators
     of final league position.
   - Defensive efficiency (goals conceded per match) proves more
     decisive than attacking output alone.
   - Away win rate is the clearest differentiator between elite and
     mid-table clubs — squad depth and tactical flexibility that
     home form alone can't demonstrate.
   ============================================================ */
