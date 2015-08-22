require 'bullet'
require 'movable'
require 'gun'


function love.load()
    Bullets = {}
    gun = Gun:new()

    love.graphics.setBackgroundColor(0,0,0)
end

function love.draw(dt)
    gun:draw(dt)
    for _, db in ipairs(Bullets) do
        db:draw(dt)
    end

    love.graphics.print("Bullets: " .. #Bullets, 10, 10)
    love.graphics.print("Gun power: " .. gun.power, 10, 24)
end

function love.update(dt)
    Wwidth, Wheight = love.window.getDimensions()
    CenterX, CenterY = Wwidth/2, Wheight/2

    -- mouse stuff
    MouseX, MouseY = love.mouse.getPosition()
    local abs = math.abs
    local centerToX, centerToY = abs(CenterX - MouseX), abs(CenterY - MouseY)
    CenterToMouse = math.sqrt(centerToX^2 + centerToY^2)

    if gun.shooting then
        gun.power = CenterToMouse
    end

    for _, ub in ipairs(Bullets) do
        ub:update(dt)
    end
    local isDown = love.keyboard.isDown
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
end

function love.mousepressed(x, y, b)
    if CenterToMouse <= gun.size then
        gun.shooting = true
    end
end

function love.mousereleased(x, y, b)
    gun:shootFrom(x, y)
end
