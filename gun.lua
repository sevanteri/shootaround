
Gun = {
    dir = 0,
    size = 20,
    power = 200,
    shooting = false,
}

function Gun:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    return o
end

function Gun:draw(dt)
    love.graphics.setColor(240, 240, 240)
    love.graphics.circle('fill', CenterX, CenterY, self.size)
    if self.shooting then
        love.graphics.setColor(200, 0,0)
        love.graphics.circle('fill', CenterX, CenterY, 5)
    end
end

function Gun:shootFrom(x, y)
    if not gun.shooting then return end
    local gunX, gunY = Wwidth/2, Wheight/2
    local gunXtoMouseX, gunYtoMouseY = gunX - x, gunY - y

    local dir = math.atan2(gunYtoMouseY, gunXtoMouseX)

    local bullet = getBullet(Bullets)
    bullet.x = gunX
    bullet.y = gunY
    bullet.dir = dir
    bullet.speed = gun.power
    gun.shooting = false
end
