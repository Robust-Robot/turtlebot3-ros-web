/*
 * @Author: https://github.com/WangEn
 * @Author: https://gitee.com/lovetime/
 * @Date:   2019-06-18
 * @lastModify 2019-06-20 11:45:41
 * +----------------------------------------------------------------------
 * | Weadmin [ 后台管理模板 ]
 * | 基于Layui http://www.layui.com/
 * +----------------------------------------------------------------------
 */
/**
 * 扩展一个Menu模块，动态获取左侧菜单
 * 目前多级子菜单是通过延时循环获取的方式
 * 也可以采用点击时获取下级子菜单的方式
 * 当然，具体的情况要参照自己的需求及api返回结构
 **/



layui.define('jquery', function(exports) {
	var $ = layui.jquery;
	var menu_list = new Map();
	var menu = {
		getMenu: function(curl) {
			var that = this;
			if (!$('#side-nav').length) {
				return;
			}
			$.getJSON(curl, function(res) {
				var menuList = res.data;
				var items = [];
				var _ul = $('<ul></ul>').addClass('nav').attr('id', 'nav');
				$.each(menuList, function(index, val) {
					var item = '<li id="menu' + val.id + '"><a _href="' + val.url + '"><i class="iconfont">' + val.icon +
						'</i><cite>' + val.name + '</cite>';
					if (val.id > 1000) {
						//item +='<span id="msg' + val.id + '"><span class="layui-badge layui-bg-blue" style="float:right;">0</span></span>';
					}
					item +='<i class="iconfont nav_right">&#xe697;</i></a></li>';

					items.push(item);
					if (val.children && val.children.length) {
						//有二级子菜单
						setTimeout(function() {
							that.getSubMenu(val.id, val.children);
						}, 500);
					}
					//获取该子菜单的消息数量
					//getMsgQuan(val.id);
					menu_list.set(val.id, val.name);
				});
				$('#side-nav').empty();
				_ul.append(items.join(''));
				$('#side-nav').append(_ul);

			});
		},
		/**
		 * @param {Object} id 上级子菜单id,拼接menu获取元素
		 * @param {Object} subList 子菜单列表
		 */
		getSubMenu: function(id, subList) {
			var that = this;
			var subItems = [];
			var subUl = $('<ul></ul>').addClass('sub-menu');
			$.each(subList, function(idx, sub) {
				var subItem = '<li id="menu' + sub.id + '"><a _href="' + sub.url + '"><i class="iconfont">&#xe6a7;</i><cite>' + sub.name + '</cite>'
					+ '<span id="msg' + sub.id + '"><span class="layui-badge layui-bg-blue" style="float:right;">0</span></span></a>'//添加一个数量提示
					+ '</li>';
				subItems.push(subItem);
				if (sub.children && sub.children.length) {
					setTimeout(function() {
						that.getSubMenu(sub.id, sub.children);
					}, 1500);
				}
				//获取该子菜单的消息数量
				//getMsgQuan(sub.id);
				menu_list.set(sub.id, sub.name);
			});
			subUl.append(subItems.join(''));
			$('#menu' + id).append(subUl);
		},

		reflash: function(){
			menu_list.forEach(function (value, key) {
				getMsgQuan(key);
			});
		}
	};

	
	//通过对应id，分配相应的接口获取消息数量
	function getMsgQuan(id)
	{
        //2022.7.1 Tiger
        clean_up(id);
        return;
        
		switch (id) {
			case 3://待审核的平台用户数量
				getData("/Project/GetUserCheckMsgQuan",id);
				break;
			case 101://采购商所有项目数量
				getData("/Project/GetAllProjectCount", id);
				break;
			case 102://以委托项目数量
				getData("/Project/GetProjectCount?status=1,10,11", id);
				break;
			case 103://采购商已编制项目数量
				postData("/Project/GetProjects",2, id);
				break;
			case 104://采购商通过审核项目数量
				getDataBlue("/Project/GetProjectCount?status=3", id);
				break;
			case 105://采购商已公布项目项目数量
				getDataBlue("/Project/GetProjectCount?status=4", id);
				break;
			case 106://正在报名
				getDataBlue("/Project/GetSigningProjectList", id);
				break;
			case 108://正在报价
				getDataBlue("/Project/GetBiddingProjectList", id);
				break;
			case 109://报价完毕待审批
				getData("/Project/GetProjectBidResultList", id);
				break;
			case 110://待确认结果
				getDataBlue("/Project/GetBadeProjectList", id);
				break;
			case 111://中止项目
				getDataBlue("/Project/GetAbortProjects", id);
				break;
			case 112://废标项目
				getDataBlue("/Project/GetAbandonedProjects", id);
				break;
			case 113://结项项目
				getDataBlue("/Project/GetClosureProjects", id);
				break;

			case 121://调研项目
				getDataBlue("/Project/GetDyProjectList?status=0,1", id);
				break;
			case 122://调研正在报价
				getDataBlue("/Project/GetDyProjectList?status=2", id);
				break;
			case 123://正在调研
				getDataBlue("/Project/GetDyProjectList?status=3", id);
				break;
			case 124://调研结束项目
				getDataBlue("/Project/GetDyProjectList?status=4", id);
				break;
			case 125://调研结项项目
				getDataBlue("/Project/GetDyProjectList?status=5", id);
				break;
			case 126://调研中止项目
				getDataBlue("/Project/GetDyProjectList?status=6", id);
				break;


			case 201://代理商所有待编制项目数量
				getData("/Project/GetFormatProjectCount", id);
				break;
			case 202://代理商所有已经编制项目数量
				getData("/Project/GetProjectCount4Agency?status=2", id);
				break;
			case 203://代理商采购人通过项目数量
				getData("/Project/GetProjectCount4Agency?status=3", id);
				break;
			case 204://正在报名
				getDataBlue("/Project/GetReadyProjectList", id);
				break;
			case 205://正在报名
				getDataBlue("/Project/GetSigningProjectList", id);
				break;
			case 206:
				getDataBlue("/Project/GetBiddingProjectList", id);
				break;
			case 207:
				getData("/Project/GetProjectBidResultList", id);
				break;
			case 208://待确认结果
				getDataBlue("/Project/GetBadeProjectList", id);
				break;
			case 209://中止项目
				getDataBlue("/Project/GetAbortProjects", id);
				break;
			case 210://废标项目
				getDataBlue("/Project/GetAbandonedProjects", id);
				break;
			case 211://结项项目
				getDataBlue("/Project/GetClosureProjects", id);
				break;

			case 212://待报价
				getDataBlue("/Project/GetSignedProjectList", id);
				break;


			case 301:
				getDataBlue("/Project/GetReadyProjectList", id);
				break;
			case 302://正在报名
				getData("/Project/GetSigningProjectList", id);
				break;
			case 303:
				getDataBlue("/Project/GetBiddingProjectList", id);
				break;
			case 304:
				getDataBlue("/Project/GetTimeUpProjectList", id);
				break;
			case 305://中止项目
				getDataBlue("/Project/GetAbortProjects", id);
				break;
			case 306://废标项目
				getDataBlue("/Project/GetAbandonedProjects", id);
				break;
			case 307://结项项目
				getDataBlue("/Project/GetClosureProjects", id);
				break;
			case 311://正在报名调研项目
				getDataBlue("/Project/GetDyProjectList?status=2", id);
				break;

			case 312://正在填报调研项目
				getDataBlue("/Project/GetDyProjectList?status=3", id);
				break;
			case 313://填报结束-调研项目
				getDataBlue("/Project/GetDyProjectList?status=4", id);
				break;
			case 314://结项项目-调研项目
				getDataBlue("/Project/GetDyProjectList?status=5", id);
				break;
			default: clean_up(id); break;
		}
	}
	//通过网络接口，获取消息数量并且加载到菜单
	function postData(interface,sta, id) {
		$.ajax({
			type: "post",
			dataType: "json",
			url: interface,
			data: { status:sta},
			success: function (data) {
				if (data.code == 0) {
					$('#msg' + id).empty();
					$('#msg' + id).append('<span class="layui-badge" style="float:right;">' + data.count + '</span>');
				}
			}
		});
	}
	function getData(interface,id) {
		$.ajax({
			type: "GET",
			dataType: "json",
			url: interface,
			success: function (data) {
				if (data.code == 0) {
					$('#msg' + id).empty();
					$('#msg' + id).append('<span class="layui-badge" style="float:right;">' + data.count + '</span>');
				}
			}
		});
	}
	//通过网络接口，获取消息数量并且加载到菜单,蓝色
	function getDataBlue(interface, id) {
		$.ajax({
			type: "GET",
			dataType: "json",
			url: interface,
			success: function (data) {
				if (data.code == 0) {
					$('#msg' + id).empty();
					$('#msg' + id).append('<span class="layui-badge layui-bg-blue" style="float:right;">' + data.count + '</span>');
				}
			}
		});
	}

	function clean_up(id) {
		$('#msg' + id).empty();
	}

	exports('menu', menu);
});
