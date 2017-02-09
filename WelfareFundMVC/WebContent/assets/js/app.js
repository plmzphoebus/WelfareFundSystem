angular.module('myApp', [])
    .controller('allMemberCtrl', function($scope, MemberService) {
        MemberService.getMember().then(function(response) {
            $scope.members = response;
        });
    }).controller('memberDetailCtrl', function($scope, MemberService, AccountService, $http, WelfareService, ReceiveWelfareService, CommunityService, PreferPaymentService) {
        $scope.saving = '';
        $scope.receive = '';
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

        $scope.savingFund = function() {
            $http.post('savingFund.do', $scope.saving).then(function(response) {
                alert("success");
                window.location.reload();
            }, function(error) {
                alert("error");
            });
        };
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
        $scope.preferpayment = '';
        $scope.entranceDate = '';
        MemberService.getMemberById(findGetParameter("id")).then(function(response) {
            $scope.member = response;
            $scope.preferpayment = $scope.member.preferPayment.preferPaymentId;
            console.log("preferpayment", $scope.preferpayment);
            $scope.entranceDate = new Date($scope.member.entranceDate);
        });
        AccountService.getAccountDetail(findGetParameter("acid")).then(function(response) {
            $scope.transactions = response;
        });
        $scope.savingFund = function() {
            $http.post('savingFund.do', $scope.saving).then(function(response) {
                alert("success");
                window.location.reload();
            }, function(error) {
                alert("error");
            });
        };
        $scope.receiveWelfare = function() {
            console.log("receive", $scope.receive)
            $http.post("saveReceiveWelfare.do", $scope.receive).then(function(response) {
                console.log("success", response);
                window.location.reload();
            }, function(error) {
                console.log("error", error);
            });
        }
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
        PreferPaymentService.getallPreferPayment().then(function(response) {
            $scope.preferPayments = response;
        });

        
    }).controller('newMemberCtrl', function($scope, CommunityService, PreferPaymentService, $http, MemberTypeService) {
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
    }).controller('allWelfareCtrl', function($scope, WelfareService, $http) {
        $scope.data = '';
        WelfareService.getallWelfare().then(function(response) {
            $scope.welfares = response
        })
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
            console.log("amountofDate", amountofDate);
            console.log("amountofMoney", amountofMoney);
            $scope.data.conditionals = [];
            var condition = '[';
            for (var i = 0; i < amountofDate.length; i++) {
                if (i + 1 == amountofDate.length) {
                    condition += "{\"amountofDate\":\"" + amountofDate[i] + "\",";
                    condition += "\"welfareMoney\":\"" + amountofMoney[i] + "\"";
                    condition += "}";
                } else {
                    condition += "{\"amountofDate\":\"" + amountofDate[i] + "\",";
                    condition += "\"welfareMoney\":\"" + amountofMoney[i] + "\"";
                    condition += "},";
                }
            }
            condition += ']';
            console.log("condition", condition);
            var obj = JSON.parse(condition)
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
            listAllRecieveWelfare: function(memberID) {
                return $http.get('listReceiveWelfare/' + memberID + '.do').then(function(response) {
                    console.log('receiveWelfare', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        }
    }).service('PreferPaymentService', function($http) {
        return {
            getallPreferPayment: function() {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('listallPreferPayment.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('Get Post', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        }
    }).service('MemberTypeService', function($http) {
        return {
            getallMemberType: function() {
                // $http returns a promise, which has a then function, which also
                // returns a promise.
                return $http.get('listallMemberType.do').then(function(response) {
                    // In the response, resp.data contains the result. Check the
                    // console to see all of the data returned.
                    console.log('memberType', response);
                    return response.data;
                }, function(error) {
                    console.log(error);
                    return error;
                });
            }
        }
    })
    .service('ReceiveWelfareService', function($http) {
        return {
            listReceiveWelfare: function(memberId) {
                return $http.get('listReceiveWelfare/' + memberId + '.do').then(function(response) {
                    console.log('listReceiveWelfare', response.data);
                    return response.data;
                }, function(error) {
                    console.log('receiveWelfare Error', error);
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