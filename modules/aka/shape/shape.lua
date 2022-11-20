-- shape.lua
-- Copyright (c) Akatsumekusa

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

-- Circular doubly linked list for shape in Aegisub.
-- Supports line and cubic bézier curve. Note the absence of b-spline curve.
shape = {
    prev = nil,
    next = nil,

    -- An ASS drawing command like this
    -- m 100 100 l 200 100 b 200 155.23 155.23 200 100 200 l 100 100
    -- will be parse into four control points like this
    -- point_1 = {
    --     prev = point_4,
    --     next = point_2,
    --     pos = {x = 100, y = 100}
    -- }
    -- point_2 = {
    --     prev = point_1,
    --     next = point_3,
    --     pos = {x = 200, y = 100},
    --     next_bezier_point = {x = 200, y = 155.23}
    -- }
    -- point_3 = {
    --     prev = point_2,
    --     next = point_4,
    --     pos = {x = 100, y = 200},
    --     last_bezier_point = {x = 155.23, y = 200}
    -- }
    -- point_4 = {
    --     prev = point_3,
    --     next = point_1,
    --     pos = {x = 100, y = 100}
    -- }
    pos = nil, -- {x = nil, y = nil}
    last_bezier_point = nil, -- {x = nil, y = nil}
    next_bezier_point = nil -- {x = nil, y = nil}
}

function shape:new(o)
    o = o or {}
    setmetatable(o, self) self.__index = self
    return o
end
