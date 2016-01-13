	function showAlert() {
//	  if (trim($("#inputAlert").html())=="") {
//		if ($("#login").size()==1) {
//			msg='<font color="red">Please login first if you have not done so. </font><br /><br />';
//			$("#inputAlert").html(msg);			
//		} else {
			getAlerts();
//			$("#inputAlert").removeClass("hide");
//		}
//	  } else {
//		  $("#inputAlert").html("");
//	  }
	}
	
	function addAlert() {
		if (trim($("#alertKw").val())=="") {
			alert("Please enter a valid keyword");
			return 0;
		}
		 $.ajax({
			 type: "POST",
			 url: "/coupon/add-alert",
			 data: "alertKw=" + $("#alertKw").val(),
			 success: function(data){
//			 	$("#inputAlert").html("");
			 	showAlert();
			 	//$("#inputAlert").append(data);
			 }
		}); 		
	}

	function getAlerts() {
		 $.ajax({
			 type: "POST",
			 url: "/coupon/get-alerts",
			 success: function(data){
			 	$("#inputAlert").html(data);
			 }
		}); 		
	}

	function editAlert(id) {
		 $.ajax({
			 type: "POST",
			 url: "/coupon/edit-alert/",
			 data: "id=" + id,
			 success: function(data){
			 	$("#inputAlert").html(data);
			 }
		}); 		
	}

	function deleteAlert(id) {
		 $.ajax({
			 type: "POST",
			 url: "/coupon/delete-alert/",
			 data: "id=" + id,
			 success: function(data){
//			 	$("#inputAlert").html("");
			 	getAlerts();
			 	//$("#inputAlert").append(data);
			 }
		}); 		
	}

	function trim(str, chars) {
		return ltrim(rtrim(str, chars), chars);
	}
	 
	function ltrim(str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
	}
	 
	function rtrim(str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
	}
	
	function submitDeal() {
		if (trim($("#submitDeal").val())=="") {
			alert("Please enter a valid Deal");
			return 0;
		}
		 $.ajax({
			 type: "POST",
			 url: "/coupon/submit-deal",
			 data: "submitDeal=" + $("#submitDeal").val(),
			 success: function(data){
			 	$("#submitDealReturnText").html(data);
			 }
		}); 		
	}

