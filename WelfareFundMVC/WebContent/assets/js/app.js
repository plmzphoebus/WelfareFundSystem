angular.module('myApp', [])
    .controller('allMemberCtrl', function($scope, MemberService) {
        MemberService.getMember().then(function(response) {
            $scope.members = response;
            $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
            		$(".datatable").DataTable();
            });
        });
    }).directive('onFinishRender', function ($timeout) {
        return {
            restrict: 'A',
            link: function (scope, element, attr) {
                if (scope.$last === true) {
                    $timeout(function () {
                        scope.$emit(attr.onFinishRender);
                    });
                }
            }
        }
    }).controller('memberDetailCtrl', function($scope, MemberService, AccountService, $http, WelfareService, ReceiveWelfareService, CommunityService) {
        $scope.saving = {};
        $scope.receive = [];
        $scope.entranceDate = '';
        $scope.paymentType = '' ;
        $scope.peroidOfMembership = '';
        $scope.member = {} ;
        $scope.lastTransaction ={};
        $scope.nextPaymentYear="";
        $scope.nextPaymentMonth="";
        $scope.nextPayment = 0;
        $scope.startDate = 0;
        $scope.endDate = 0;
        $scope.receive.date = new Date();
        
        function findGetParameter(parameterName) {
            var result = null,
                tmp = [];
            location.search.substr(1).split("&").forEach(function(item) {
                tmp = item.split("=");
                if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
            });
            return result;
        }


        ReceiveWelfareService.listReceiveWelfare(findGetParameter("id")).then(function(responsewelfare) {
            $scope.receivewelfares = responsewelfare;
        });
        AccountService.getAccountDetail(findGetParameter("acid")).then(function(response) {
            $scope.transactions = response;
        });
$http.get('getLastTransactionByAccountId/'+findGetParameter("acid")+'.do').then(function (response){
        	
        	$scope.lastTransaction = response.data;
        	$scope.nextPaymentYear = new Date($scope.lastTransaction.nextPayment).getFullYear();
        	$scope.nextPaymentMonth = new Date($scope.lastTransaction.nextPayment).getMonth()+1;
        	$scope.startDate = new Date($scope.lastTransaction.nextPayment).getTime();
        	console.log("$scope.startDate",$scope.startDate);
        	//ตรวจสอบการออมเงินแบบรายเดือน
        	if($scope.member.preferPayment == "รายเดือน"){
        		$scope.nextPayment = getNextMonth($scope.nextPaymentYear, $scope.nextPaymentMonth,1).getTime();
        		$scope.endDate = new Date($scope.lastTransaction.nextPayment);        		
        	// ตรวจสอบการออมเงินแบบรายครึ่งปี
        	}else if($scope.member.preferPayment == "รายครึ่งปี"){
        		$scope.nextPayment = getNextMonth($scope.nextPaymentYear,$scope.nextPaymentMonth,6).getTime();
        		$scope.endDate = getNextMonth($scope.nextPaymentYear,$scope.nextPaymentMonth,5).getTime();
        		console.log("$scope.endDate",$scope.endDate);
        	//ตรวจสอบการออมเงินแบบรายปี
        	}else{
        		$scope.nextPayment = getNextMonth($scope.nextPaymentYear,$scope.nextPaymentMonth,12).getTime();
        		$scope.endDate = getNextMonth($scope.nextPaymentYear,$scope.nextPaymentMonth,11).getTime();
        		console.log("$scope.endDate",$scope.endDate);
        	}
        		
        },function (error){
        	console.log("error",error);
        });
        $scope.getAmountOfPeriod = function(year, month, period){
        	var totalAmount = 0 ;
        	for(var i = 0 ; i<period ;i++){
        		if(month>12){
        			month=1;
        			year++;
        		}
        		totalAmount += $scope.getAllDateOfMonth(year,month);
        		month++;
        	}
        	return totalAmount;
        }
        $scope.savingFund = function() {
        	console.log("$scope.lastTransaction",$scope.lastTransaction);
        	$scope.saving.account = {};
        	$scope.saving.date = new Date($scope.lastTransaction.nextPayment).getTime();
        	$scope.saving.startDate = new Date($scope.lastTransaction.nextPayment).getTime();
        	$scope.saving.nextPayment = $scope.nextPayment;
        	$scope.saving.account.accountId = $scope.accountId;
        	if($scope.member.preferPayment == "รายเดือน"){
        		$scope.saving.endDate = new Date($scope.lastTransaction.nextPayment).getTime();
        		$scope.saving.date = $scope.saving.endDate;
            	$scope.saving.startDate = $scope.saving.endDate;
        		
        		$scope.saving.amount = $scope.getAllDateOfMonth($scope.nextPaymentYear, $scope.nextPaymentMonth);
        	}else if($scope.member.preferPayment == "รายครึ่งปี"){
        		$scope.saving.endDate = $scope.endDate;
        		$scope.saving.amount = parseInt($("#amountOfSaving").html());
        	}else{
        		$scope.saving.endDate = $scope.endDate;
        		$scope.saving.amount = $scope.getAmountOfPeriod($scope.nextPaymentYear, $scope.nextPaymentMonth,12);
        	}
        	console.log("$scope.saving",$scope.saving);
        	
            $http.post('savingFund.do', $scope.saving).then(function(response) {
                alert("success");
                window.location.reload();
            }, function(error) {
                alert("error");
            });
        };

        
        
        $scope.getAllDateOfMonth=function(year,month){
        	var date = new Date(year,month,0);
        	return date.getDate();
        }
        $scope.receiveWelfare = function() {
            console.log("receive", $scope.receive)
            $http.post("saveReceiveWelfare.do", $scope.receive).then(function(response) {
                console.log("success", response);
                window.location.reload();
            }, function(error) {
                console.log("error", error);
            });
        }
        $scope.accountId = findGetParameter("acid");
        $scope.memberId = findGetParameter("id");

        WelfareService.getallWelfare().then(function(response) {
            $scope.welfares = response;
        });
        $scope.listConditions = [];
        $scope.selectedWelfare = function(){
        	var welfareID = $scope.receive.welfare.welfareID;
        	$scope.listConditions = [];
        	for(var i = 0 ; i < $scope.welfares.length ; i++){
        		if($scope.welfares[i].welfareID == welfareID){
        			for(var innerloop = 0 ; innerloop < $scope.welfares[i].conditionals.length ; innerloop++){
        				if($scope.peroidOfMembership >= $scope.welfares[i].conditionals[innerloop].amountofDate){
        					$scope.listConditions.push($scope.welfares[i].conditionals[innerloop]);
        				}
        			}
        			break;
        		}
        	}
        }
        
        MemberService.getMemberById(findGetParameter("id")).then(function(response) {
            $scope.member = response;
            $scope.paymentType = $scope.member.preferPayment;
            $scope.entranceDate = new Date($scope.member.entranceDate);
            var currentDate = new Date();
            var timeDiff = Math.abs(currentDate.getTime() - $scope.entranceDate.getTime());
            $scope.peroidOfMembership = Math.ceil(timeDiff / (1000 * 3600 * 24));
            console.log("peroidOfMembership",$scope.peroidOfMembership);
            console.log("scope",$scope);
        });
        
        
        function getNextMonth(year, month,next){
        	for(var i = 0 ; i<next ;i++){
        		if(month>12){
        			month=1;
        			year++;
        		}
        		month++;
        	}
        	return new Date(year,month,0);
        }
        AccountService.getAccountDetail(findGetParameter("acid")).then(function(response) {
            $scope.transactions = response;
        });
        $scope.saveMember = function() {
            $scope.member.entranceDate = $scope.entranceDate;
            console.log("check", $scope.member);
            $http.put("saveMember.do", $scope.member).then(function(response) {
                alert("Success");
                window.location.href = "memberDetail.jsp?id=" + $scope.memberId + "&acid=" + $scope.accountId;
            }, function(error) {
                alert(error);
            });
        }
        $scope.accountId = findGetParameter("acid");
        $scope.memberId = findGetParameter("id");
        CommunityService.getallCommunity().then(function(response) {
            $scope.communities = response;
        });

        
    }).controller('newMemberCtrl', function($scope, CommunityService, $http) {
        $scope.data = '';
        $scope.newMember = function() {
            console.log("data", JSON.stringify($scope.data));
            $http.post('saveMember.do', $scope.data).then(function(response) {
                alert("success");
                window.location.href = 'allMember.jsp';
            }, function(error) {
                alert("error");
            });
        }
        $scope.data.firstCommunity= "";
        CommunityService.getallCommunity().then(function(response) {
            $scope.communities = response;
            $scope.firstCommunity = $scope.communities[0].communityId;
            console.log("firstCommunity",$scope.firstCommunity);
        });
    }).controller('allCommunityCtrl', function($scope, CommunityService, $http) {
        $scope.data = '';
        CommunityService.getallCommunity().then(function(response) {
            $scope.communities = response;
        })
        $scope.deleteCommunity = function(communityId) {
            console.log(communityId);
            $http.delete("deleteCommunity/" + communityId + ".do").then(function(response) {
                console.log(response);
                window.location.reload();
            }, function(error) {
                window.location.reload();
                console.log(error);
            })
        };
        $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
    		$(".datatable").DataTable();
        });
    }).controller('allWelfareCtrl', function($scope, WelfareService, $http) {
        $scope.data = '';
        WelfareService.getallWelfare().then(function(response) {
            $scope.welfares = response
        });
        $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
    		$(".datatable").DataTable();
        });
        $scope.deleteWelfare = function(welfareId) {
            console.log(welfareId);
            $http.delete("deleteWelfare/" + welfareId + ".do").then(function(response) {
                console.log(response);
                window.location.reload();
            }, function(error) {
                window.location.reload();
                console.log(error);
            })
        };
        $scope.saveWelfare = function() {
            $http.put("saveWelfare.do", $scope.welfare).then(function(response) {
                alert("Success");
                window.location.href = "allWelfare.jsp";
            }, function(error) {
                alert(error);
            });
        }
    }).controller('newWelfareCtrl', function($scope, WelfareService, $http) {
        $scope.data = '';
        $scope.saveWelfare = function() {
            var amountofDate = $("input[name='amountofDate[]']").map(function() {
                return $(this).val();
            }).get();
            var amountofMoney = $("input[name='welfareMoney[]']").map(function() {
                return $(this).val();
            }).get();
            var conditionDetail = $("input[name='conditionDetail[]']").map(function() {
                return $(this).val();
            }).get();
            console.log("amountofDate", amountofDate);
            console.log("amountofMoney", amountofMoney);
            console.log("amountofMoney", conditionDetail);
            $scope.data.conditionals = [];
            var condition = '[';
            for (var i = 0; i < amountofDate.length; i++) {
            	condition += "{\"conditionDetail\":\"" + conditionDetail[i] + "\",";
                condition += "\"amountofDate\":\"" + amountofDate[i] + "\",";
                condition += "\"welfareMoney\":\"" + amountofMoney[i] + "\"";
                if (i + 1 == amountofDate.length) {
                    condition += "}";
                } else {
                    condition += "},";
                }
            }
            condition += ']';
            console.log("condition", condition);
            var obj = JSON.parse(condition);
            $scope.data.conditionals = obj;
            console.log("condition", obj);
            console.log("data", $scope.data);
            $http.post("saveWelfare.do", $scope.data).then(function(response) {
                console.log("success", response);
                window.location.href = "allWelfare.jsp";
            }, function(error) {
                console.log("error", error);
            });
        }
    }).controller('editWelfareCtrl', function($scope, $http, WelfareService) {
        $scope.welfare = '';

        function findGetParameter(parameterName) {
            var result = null,
                tmp = [];
            location.search.substr(1).split("&").forEach(function(item) {
                tmp = item.split("=");
                if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
            });
            return result;
        }
        $scope.saveWelfare = function() {
            $http.put("saveWelfare.do", $scope.welfare).then(function(response) {
                alert("Success");
                window.location.href = "allWelfare.jsp";
            }, function(error) {
                alert(error);
            });
        }
        WelfareService.getAllWelfareById(findGetParameter("welfareId")).then(function(response) {
            $scope.welfare = response;
        });
    }).controller('newCommunityCtrl', function($scope, CommunityService, $http) {
        $scope.data = '';
        $scope.saveCommunity = function() {
            $http.post("saveCommunity.do", $scope.data).then(function(response) {
                console.log(response);
                window.location.href = 'allCommunity.jsp';
            }, function(error) {
                console.log(error);
            });
        }
    }).controller('editCommunityCtrl', function($scope, $http, CommunityService) {
        $scope.community = '';

        function findGetParameter(parameterName) {
            var result = null,
                tmp = [];
            location.search.substr(1).split("&").forEach(function(item) {
                tmp = item.split("=");
                if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
            });
            return result;
        }
        $scope.saveCommunity = function() {
            $http.put("saveCommunity.do", $scope.community).then(function(response) {
                alert("Success");
                window.location.href = "allCommunity.jsp";
            }, function(error) {
                alert(error);
            });
        }
        CommunityService.getCommunityById(findGetParameter("communityId")).then(function(response) {
            $scope.community = response;
        });
    }).controller('printCtrl', function($scope,$http,MemberService,AccountService){
    	 function findGetParameter(parameterName) {
             var result = null,
                 tmp = [];
             location.search.substr(1).split("&").forEach(function(item) {
                 tmp = item.split("=");
                 if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
             });
             return result;
         }
    	 MemberService.getMemberById(findGetParameter("id")).then(function(response){
    		 $scope.member = response ;
    	 });
    	 AccountService.getTransactionDetail(findGetParameter("transactionid")).then(function(response){
    		$scope.transaction = response ;  
    	 });
    })
    .controller('printReceiveWelfareCtrl', function($scope,$http,MemberService,ReceiveWelfareService){
    	 function findGetParameter(parameterName) {
             var result = null,
                 tmp = [];
             location.search.substr(1).split("&").forEach(function(item) {
                 tmp = item.split("=");
                 if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
             });
             return result;
         }
    	 MemberService.getMemberById(findGetParameter("id")).then(function(response){
    		 $scope.member = response ;
    	 });
    	 ReceiveWelfareService.getReceiveWelfareById(findGetParameter("receiveWelfareId")).then(function(response){
    		$scope.receiveWelfare = response;
    	 });
    }).service('MemberService', function($http) {
        return {
            getMember: function() {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('listMember.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('Get Post', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            },
            getMemberById: function(id) {
                return $http.get('getMember/' + id + '.do').then(function(response) {
                    console.log('memberDetail', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        };
    }).service('CommunityService', function($http) {
        return {
            getallCommunity: function() {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('listallCommunity.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('Get Post', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            },
            getCommunityById: function(communityId) {
                return $http.get('getCommunity/' + communityId + '.do').then(function(response) {
                    console.log('editCommunity', response)
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        }
    }).service('WelfareService', function($http) {
        return {
            getallWelfare: function() {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('listAllWelfare.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('Get Post', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            },
            getAllWelfareById: function(welfareId) {
                return $http.get('getWelfare/' + welfareId + '.do').then(function(response) {
                    console.log('editWelfare', response)
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        }
    }).service('ReceiveWelfareService', function($http) {
        return {
            listReceiveWelfare: function(memberId) {
                return $http.get('listReceiveWelfare/' + memberId + '.do').then(function(response) {
                    console.log('listReceiveWelfare', response.data);
                    return response.data;
                }, function(error) {
                    console.log('receiveWelfare Error', error);
                    return error;
                });
            },
            getReceiveWelfareById: function(receiveWelfareId){
            	return $http.get('getReceiveWelfare/'+receiveWelfareId+'.do').then(function(response){
            		console.log('getReceiveWelfareById',response.data);
            		return response.data;
            	},function(error){
            		console.log('getReceiveWelfareById Error',error);
            		return error;
            	});
            }
        }
    }).service('AccountService', function($http) {
        return {
            getAccountDetail: function(accountid) {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('getTransaction/' + accountid + '.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('accountTransaction', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });

            },
            getTransactionDetail: function(transactionid) {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('getTransactionDetail/' + transactionid + '.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('accountTransaction', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        }
    })