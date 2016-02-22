/**
 * Insentek WebApp Core 1.0
 * (c) 2012-2015 Insentek
 */
window.App = window.App || {};
App.loadData = function () {
	var data = {}, callback;
	if (arguments.length == 3) {
		callback = arguments[2];
	} else {
		data = arguments[2];
		callback = arguments[3];
	}
	var data = arguments.length == 3 ? {} : arguments[2];
	$.get("/ajax/api/param/data/query/" + arguments[0] + "/" + arguments[1], data, function (data) {
		if (data.error == 0) {
			var dset = data.data;
			if (dset.nodes != null) {
				$.each(dset.nodes, function (idx, v) {
					for (var i = 0; i < v.data.length; i++) {
						dset.nodes[idx].data[i] = Number(dset.nodes[idx].data[i]);
					}
				});
			}
		}
		callback(data.error, data.data);
	});
}