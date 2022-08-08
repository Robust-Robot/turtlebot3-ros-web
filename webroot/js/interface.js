//环境路径，部署时候只用相对路径
//var host_path = "http://www.yxk.pub";
var host_path = "";
var ws_address="ws://localhost:9090";

//用户模块
var login_interface = "/User/UserLogin";
var register_interface = "/User/Register";
var getuserlist_interface = "/User/GetUserList";
var edituser_interface = "/User/EditUser";
var checkuser_interface = "/User/CheckUser";
var forget_interface = "/User/forget";
var phonecode_interface = "/User/GetVerificationCode";
var userlogout_interface = "/User/UserLogout";
var usercheck_interface = "/User/UserCheck";
var GetUserById_interface = "/User/GetUserById";
var AuditUserInfo_interface = "/User/AuditUserInfo";
var DeleteUser_interface = "/User/DeleteUser";//暂定

//系统模块
var getdoctype_interface = "/System/GetDocType";
var adddoctype_interface = "/System/AddDocType";
var editdoctype_interface = "/System/EditDocType";
var deletedoctype_interface = "/System/DeleteDocType";
var delete_interface = "/System/Delete";
var addtopic_interface = "/System/AddTopic";
var edittopic_interface = "/System/EditTopic";
var deletetopic_interface = "/System/DeleteTopic";
var gettopiclist_interface = "/System/GetTopicList";
var additem_interface = "/System/AddItem";
var edititem_interface = "/System/EditItem";
var deleteitem_interface = "/System/DeleteItem";
var getitemlist_interface = "/System/GetItemList";
var getitembyid_interface = "/System/GetItemById";


//文件模块
var downloadfile_interface = "/File/DownloadFile";
var menu_interface = "/File/Menu";
