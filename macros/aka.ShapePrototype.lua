-- aka.ShapePrototype.lua
-- Copyright (c) Akatsumekusa

-- ShapePrototype is a test project aimed at recreating the LOGO of gekijōban
-- anime Drifting Home inside Aegsiub. In the future, this project may be
-- extended into a complete automation script, providing a shape-based
-- typesetting solution in Aegisub.

-- User settings for ShapePrototype
config_file = "?user/ShapePrototype/config.json"
preset_dir = "?user/ShapePrototype"

-- ---------------------------------------------------------------------------
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.
-- ---------------------------------------------------------------------------

script_name = "ShapePrototype"
script_description = "A test project aimed at recreating the LOGO of gekijōban anime Drifting Home"
script_version = "0.1~a1"
script_author = "Akatsumekusa"
script_namespace = "aka.ShapePrototype"

function runGUI(subtitles, selected_lines, active_line)
    -- loadSettings()
    -- inline renderGUI()
    -- saveSettings()

    process()
    -- inline setUndoPoint()
end
function runLastClockwise(subtitles, selected_lines, active_line)
    -- loadSettings()
    -- inline setChirarity()

    process()
    -- inline setUndoPoint()
end
function runLastCounterwise(subtitles, selected_lines, active_line)
    -- loadSettings()
    -- inline setChirarity()

    process()
    -- inline setUndoPoint()
end

function process(settings, subtitles, selected_lines, active_line)
    -- for line in selected_lines do
    --     preprocess() -- count the nodes and add the marks
    --     validate() -- isCounterwise isComplete
    --     parse()
    --     interpret()
    --     postprocess()
    -- end
end

aegisub.register_macro(script_name .. "/" .. script_name, script_description, runGUI)
aegisub.register_macro(script_name .. "/Run the last commands clockwise", "Run the last used commands clockwise", runLastClockwise)
aegisub.register_macro(script_name .. "/Run the last commands counterwise", "Run the last used commands counterwise", runLastCounterwise)
