angular.module('myApp', [])
    .controller('allMemberCtrl', function($scope, MemberService) {
        MemberService.getMember().then(function(response) {
            $scope.members = response;
        });
    })
    .controller('memberDetailCtrl', function($scope, MemberService,AccountService,$http,WelfareService,ReceiveWelfareService) {
    $scope.saving = '';
    $scope.receive = '';
        function findGetParameter(parameterName) {
            var result = null,
                tmp = [];
            location.search
                .substr(1)
                .split("&")
                .forEach(function(item) {
                    tmp = item.split("=");
                    if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
                });
            return result;
        }
        
        WelfareService.getallWelfare().then(function(response){
    		$scope.welfares = response;
    	});

        MemberService.getMemberById(findGetParameter("id")).then(function(response) {
            $scope.member = response;
        });
        ReceiveWelfareService.listReceiveWelfare(findGetParameter("id")).then(function(responsewelfare){
            $scope.receivewelfares = responsewelfare; 
         });
        AccountService.getAccountDetail(findGetParameter("acid")).then(function(response){
        	$scope.transactions = response ;
        });
        
        $scope.savingFund = function(){      	
            $http.post('savingFund.do', $scope.saving).then(function(response) {
                alert("success");
                window.location.reload();
            }, function(error) {
                alert("error");
            });
        };
        $scope.receiveWelfare = function(){
        	console.log("receive",$scope.receive)
        	$http.post("saveReceiveWelfare.do",$scope.receive).then(function(response){
        		console.log("success",response);
        		window.location.reload();
        	},function(error){
        		console.log("error",error);
        	});
        }
        $scope.accountId = findGetParameter("acid");
        $scope.memberId = findGetParameter("id");
    })
    .controller('newMemberCtrl', function($scope, CommunityService, PreferPaymentService, $http, MemberTypeService) {
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
        CommunityService.getallCommunity().then(function(response) {
            $scope.communities = response;
        });

        PreferPaymentService.getallPreferPayment().then(function(response) {
            $scope.preferPayments = response;
        });
        MemberTypeService.getallMemberType().then(function(response) {
            $scope.memberTypes = response;
        })
    })
    .controller('allCommunityCtrl', function($scope,CommunityService,$http){
    	$scope.data = '';
    	CommunityService.getallCommunity().then(function(response){
    		$scope.communities = response ;
    	})
    	$scope.deleteCommunity = function(communityId){
    		console.log(communityId);
    		$http.delete("deleteCommunity/"+communityId+".do").then(function(response){
    			console.log(response);
    			window.location.reload();
    		},function(error){
    			window.location.reload();
    			console.log(error);
    		})
    	};
    })
    .controller('allWelfareCtrl', function($scope,WelfareService,$http){
    	WelfareService.getallWelfare().then(function(response){
    		$scope.welfares = response;
    	});
    })
    .controller('newWelfareCtrl', function($scope,WelfareService,$http){
    	$scope.data = '' ;
    	$scope.saveWelfare = function(){
    		var amountofDate = $("input[name='amountofDate[]']").map(function(){return $(this).val();}).get();
    		var amountofMoney = $("input[name='welfareMoney[]']").map(function(){return $(this).val();}).get();
    		console.log("amountofDate",amountofDate);
    		console.log("amountofMoney",amountofMoney);
    		$scope.data.conditionals = [];
    		var condition = '[';
    		for(var i = 0 ; i < amountofDate.length ; i++){
    			
    			if(i+1 == amountofDate.length){
    				condition += "{\"amountofDate\":\""+amountofDate[i]+"\"," ;
        			condition += "\"welfareMoney\":\""+amountofMoney[i]+"\"";
        			condition += "}";
    			}else{
    				condition += "{\"amountofDate\":\""+amountofDate[i]+"\"," ;
        			condition += "\"welfareMoney\":\""+amountofMoney[i]+"\"";
        			condition += "},";
    			}
    		}
    		condition += ']';
    		console.log("condition",condition);
    		var obj = JSON.parse(condition)
    		
    		$scope.data.conditionals = obj ;
    		console.log("condition",obj);
    		console.log("data",$scope.data);
    		$http.post("saveWelfare.do",$scope.data).then(function(response){
    			console.log("success",response);
    			window.location.href="allWelfare.jsp";
    		},function(error){
    			console.log("error",error);
    		});
    	}
    })
    .controller('newCommunityCtrl', function($scope,CommunityService,$http){
    	$scope.data = '';
    	$scope.saveCommunity = function(){
    		$http.post("saveCommunity.do",$scope.data).then(function(response){
        		console.log(response);
        		window.location.href = 'allCommunity.jsp';
        	},function(error){
        		console.log(error);
        	});
    	}
    	
    })
    .service('MemberService', function($http) {
        return {
            getMember: function() {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('listMember.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
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
    })
    .service('CommunityService', function($http) {
        return {
            getallCommunity: function() {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('listallCommunity.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
                        console.log('Get Post', response);
                        return response.data;
                    }, function(error) {
                        console.log(error);
                        return error;
                    });
            }
        }
    })
    .service('WelfareService', function($http) {
        return {
            getallWelfare: function() {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('listAllWelfare.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
                        console.log('Get Post', response);
                        return response.data;
                    }, function(error) {
                        console.log(error);
                        return error;
                    });
            }
        }
    })
    .service('PreferPaymentService', function($http) {
        return {
            getallPreferPayment: function() {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('listallPreferPayment.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
                        console.log('Get Post', response);
                        return response.data;
                    }, function(error) {
                        console.log(error);
                        return error;
                    });
            }
        }
    })
    .service('MemberTypeService', function($http) {
        return {
            getallMemberType: function() {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('listallMemberType.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
                        console.log('memberType', response);
                        return response.data;
                    }, function(error) {
                        console.log(error);
                        return error;
                    });
            }
        }
    })
    .service('ReceiveWelfareService', function($http){
        return {
            listReceiveWelfare : function(memberId){
                return $http.get('listReceiveWelfare/'+memberId+'.do').then(function(response){
                    console.log('listReceiveWelfare',response.data);
                    return response.data ;
                },function(error){
                    console.log('receiveWelfare Error',error);
                    return error ;
                });
            }
        }
    })
    .service('AccountService', function($http) {
        return {
        	getAccountDetail: function(accountid) {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('getTransaction/' + accountid + '.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
                        console.log('accountTransaction', response);
                        return response.data;
                    }, function(error) {
                        console.log(error);
                        return error;
                    });
            },
            getTransactionDetail: function(transactionid) {
                // $http returns a promise, which has a then function, which also returns a promise.
                return $http.get('getTransactionDetail/' + transactionid + '.do')
                    .then(function(response) {
                        // In the response, resp.data contains the result. Check the console to see all of the data returned.
                        console.log('accountTransaction', response);
                        return response.data;
                    }, function(error) {
                        console.log(error);
                        return error;
                    });
            }
        }

    })
    