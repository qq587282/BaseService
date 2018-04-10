FrontEndService = {}

function FrontEndService:Init()
	self._EventRegister = EventRegister.new();
	
	self._EventRegister:RegisterEvent( "FESConnection",         self, self.Connection );
	self._EventRegister:RegisterEvent( "FESDisConnection",      self, self.DisConnection );
    self._EventRegister:RegisterEvent( "PLSConnection",         self, self.Connection );
	self._EventRegister:RegisterEvent( "PLSDisConnection",      self, self.DisConnection );
    
    -- 注册其它服务器启动的回调
    ServerNet.SetConnectionCallback("FES");
    ServerNet.SetDisConnectionCallback("FES");
    
    ServerNet.SetConnectionCallback("PLS");
    ServerNet.SetDisConnectionCallback("PLS");
    
end


function FrontEndService:Connection( service_id, service_name )
	print("FrontEndService:Connection:"..service_name.." sid:"..service_id);
end

function FrontEndService:DisConnection( service_id, service_name )
	print("FrontEndService:DisConnection"..service_name.." sid:"..service_id);
end

--	释放函数
function FrontEndService:OnRelease()
    self._EventRegister:UnRegisterAllEvent();
end

return FrontEndService
