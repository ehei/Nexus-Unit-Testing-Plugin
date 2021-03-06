--[[
TheNexusAvenger

Icon for showing the state of a test.
--]]

local NexusUnitTestingPluginProject = require(script.Parent.Parent)
local NexusUnitTesting = NexusUnitTestingPluginProject:GetResource("NexusUnitTestingModule")

local TEST_ICON_SPRITESHEET = "http://www.roblox.com/asset/?id=4595118527"
local ICON_SIZE = Vector2.new(256,256)

local ICON_POSITIONS = {
	[NexusUnitTesting.TestState.NotRun] = Vector2.new(0,0),
	[NexusUnitTesting.TestState.InProgress] = Vector2.new(256,0),
	[NexusUnitTesting.TestState.Passed] = Vector2.new(512,0),
	[NexusUnitTesting.TestState.Failed] = Vector2.new(768,0),
	[NexusUnitTesting.TestState.Skipped] = Vector2.new(0,256),
}
local ICON_COLORS = {
	[NexusUnitTesting.TestState.NotRun] = Color3.new(0,170/255,255/255),
	[NexusUnitTesting.TestState.InProgress] = Color3.new(255/255,150/255,0),
	[NexusUnitTesting.TestState.Passed] = Color3.new(0,200/255,0),
	[NexusUnitTesting.TestState.Failed] = Color3.new(200/255,0,0),
	[NexusUnitTesting.TestState.Skipped] = Color3.new(220/255,220/255,0),
}

local TestStateIcon = NexusUnitTestingPluginProject:GetResource("NexusPluginFramework.Base.NexusWrappedInstance"):Extend()
TestStateIcon:SetClassName("TestStateIcon")



--[[
Creates a Test State Icon.
--]]
function TestStateIcon:__new()
	self:InitializeSuper("ImageLabel")
	
	--Set up changing the test state.
	self:__SetChangedOverride("TestState",function()
		self.ImageColor3 = ICON_COLORS[self.TestState]
		self.ImageRectOffset = ICON_POSITIONS[self.TestState]
	end)
	
	--Set the defaults.
	self.BackgroundTransparency = 1
	self.Image = TEST_ICON_SPRITESHEET
	self.ImageRectSize = ICON_SIZE
	self.TestState = NexusUnitTesting.TestState.NotRun
end



return TestStateIcon