angular.module('myApp', [])
    .controller('allMemberCtrl', function($scope, MemberService) {
        MemberService.getMember().then(function(response) {
            $scope.members = response;
        });
    })
    .controller('memberDetailCtrl', function($scope, MemberService,AccountService,$http) {
    $scope.saving = '';
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

        MemberService.getMemberById(findGetParameter("id")).then(function(response) {
            $scope.member = response;
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
        $scope.accountId = findGetParameter("acid");
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
    		console.log("amountofDate",amountofMoney);
    		$scope.data.conditional = [] ;
    		for(var i = 0 ; i< amountofDate.length ; i++){
    			console.log(i);
    			$scope.data.conditional[i].amountofDate = amountofDate[i];
    		}
    		for(var i = 0 ; i< amountofMoney.length ; i++){
    			console.log(i);
    			$scope.data.conditional[i].welfareMoney = amountofMoney[i];
    		}
    		console.log("data",$scope.data)
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