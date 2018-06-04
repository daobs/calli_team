

	$(document).ready(function(){
		
		
	function login(id,thumnail) {
		var url = "./kakaologin";
		url+="?id="+id+"(kakao)";
		url+="&thumnail="+thumnail;
		location.href=url;

	}
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('12bc31d2e58c54a8560099a66b569380');
		//로그아웃
		$("#kakaologout").click(function() {
			Kakao.Auth.logout();
			
		});
		// 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            //alert(JSON.stringify(res));
            
            login(res.properties.nickname,res.properties.thumbnail_image);
    
            
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
	});



