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

export script_name = "ShapePrototype"
export script_description = "A test project aimed at recreating the LOGO of gekijōban anime Drifting Home"
export script_version = "0.1~a1"
export script_author = "Akatsumekusa"
export script_namespace = "aka.ShapePrototype"

-- Basic data structure for shape
ControlPoint = {
    -- prev and next may refer to the previous and the next control point in
    -- the shape, or they could instead be a string containing the unparsed ASS
    -- drawing commands before or after the control point.
    -- The first and the last control point in a shape will have their prev or
    -- next as an empty string.
    prev = nil,
    next = nil,

    -- A ASS drawing command like this
    -- m 100 100 l 200 100 b 200 155.23 155.23 200 100 200 l 100 100
    -- will be parse into four control points like this
    -- point_1 = {
    --     pos = {x = 100, y = 100}
    --     -- last_bezier_point and next_bezier_point will not be declared and
    --     -- will thus be nil
    -- }
    -- point_2 = {
    --     pos = {x = 200, y = 100},
    --     next_bezier_point = {x = 200, y = 155.23}
    -- }
    -- point_3 = {
    --     pos = {x = 100, y = 200},
    --     last_bezier_point = {x = 155.23, y = 200}
    -- }
    -- point_4 = {
    --     pos = {x = 100, y = 100}
    -- }
    pos = {x = nil, y = nil},
    last_bezier_point = {x = nil, y = nil},
    next_bezier_point = {x = nil, y = nil}
}

function runGUI(subtitles, selected_lines, active_line)
end
function runLastClockwise(subtitles, selected_lines, active_line)
end
function runLastCounterwise(subtitles, selected_lines, active_line)
end

aegisub.register_macro(script_name .. "/" .. script_name, script_description, runGUI)
aegisub.register_macro(script_name .. "/Run the last commands clockwise", "Run the last used commands clockwise", runLastClockwise)
aegisub.register_macro(script_name .. "/Run the last commands counterwise", "Run the last used commands counterwise", script_description, runLastCounterwise)
