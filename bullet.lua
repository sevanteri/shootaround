
require 'movable'

Bullet = Movable:new()

function Bullet:new(o, x, y, dir, speed, size, color)
    if not o then
        o = o or Movable:new(o, x, y, dir, speed)
        setmetatable(o, self)
        self.__index = self

        self.size = size or 10
        self.color = color or {255, 0, 0, 255}
        self.alive = true
    end

    return o
end

function Bullet:draw(dt)
    if not self.alive then return end
    love.graphics.setColor(self.alive and self.color or {0,0,0,255})
    love.graphics.circle('fill', self.x, self.y, self.size)
end

function Bullet:update(dt)
    if not self.alive then return end
    self.x = self.x + math.cos(self.dir) * self.speed * dt
    self.y = self.y + math.sin(self.dir) * self.speed * dt

    if self.x > Wwidth  or self.x < 0
    or self.y > Wheight or self.y < 0 then
        self.alive = false
    end
end

function getBullet(list)
    for _, b in ipairs(list) do
        if not b.alive then
            b.alive = true
            return b
        end
    end

    local b = Bullet:new(nil)
    list[#list + 1] = b
    --table.insert(list, b)
    return b
end
