USE acore_world;

SET @RIDING_LEVEL = 10;

UPDATE npc_trainer SET 
    ReqLevel = @RIDING_LEVEL,
    MoneyCost = CASE SpellID
        WHEN 33388 THEN 10000      -- Apprentice Riding
        WHEN 33391 THEN 100000     -- Journeyman Riding
        WHEN 34090 THEN 1000000    -- Expert Riding
        WHEN 34091 THEN 2500000    -- Artisan Riding
        WHEN 40120 THEN 5000000    -- Cold Weather Flying
        WHEN 54197 THEN 2500000    -- Flight Master's License
    END
WHERE ReqSkillLine = 762;

UPDATE trainer_spell SET 
    ReqLevel = @RIDING_LEVEL,
    MoneyCost = CASE SpellID
        WHEN 33388 THEN 10000
        WHEN 33391 THEN 100000
        WHEN 34090 THEN 1000000
        WHEN 34091 THEN 2500000
        WHEN 40120 THEN 5000000
        WHEN 54197 THEN 2500000
    END
WHERE SpellID IN (33388, 33391, 34090, 34091, 40120, 54197);

UPDATE item_template 
SET RequiredLevel = @RIDING_LEVEL
WHERE class = 15 AND subclass = 5;
