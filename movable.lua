
Movable = {
    x = 0,
    y = 0,
    dir = 0,
    speed = 0
}

function Movable:new(o, x, y, dir, speed)
    if not o then
        o = o or {}
        setmetatable(o, self)
        self.__index = self

        self.x = 0
        self.y = 0
        self.dir = dir or 0
        self.speed = speed or 0
    end

    return o
end

function Movable:update(dt)
    self.x = self.x + math.cos(self.dir) * self.speed * dt
    self.y = self.y + math.sin(self.dir) * self.speed * dt
end
