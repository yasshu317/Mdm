
		$(document).on("click",".leftArrowIcon", function(){			
		
			width = $('.firstDivBar').css('width') === '54px' ? 0 : '54px';
			  $('.firstDivBar, .firstDivBar ul').animate({
				  width: width
			});
			$(".addIcon").css("display","none");
			$(".removeIcon").css("display","none");
/*			$(".leftIcons").css("margin-right","100px"); */
			$(".leftArrowIcon img").attr('src','images/rightarrow.png').css("padding","4px 2px");
			$(this).removeClass("leftArrowIcon").addClass("rightArrowIcon");
		});
		$(document).on("click",".rightArrowIcon", function(){
			width = $('.firstDivBar').css('width') === '154px' ? 0 : '154px';
			  $('.firstDivBar').animate({
				  width: width
			});
			$(".addIcon").css("display","block");
			$(".removeIcon").css("display","block");
			$(".leftIcons").css("margin-right","0px");
			$(".rightArrowIcon img").attr('src','images/leftarrow.png').css("padding","4px 0 0 0");
			$(this).removeClass("rightArrowIcon").addClass("leftArrowIcon");
		});
		
		$(".panel-heading").on("click",function(){
			if($(this).hasClass('collapsed')){
				$(this).children().find("img").attr("src","images/arrowupgrey.png");
				$(this).closest(".accordianPanel").css("border","1px solid #fdfdfd");				
			}else{
				$(this).children().find("img").attr("src","images/arrowdowngrey.png");
				$(this).closest(".accordianPanel").css("border","1px solid #d9e3e9");
			}
		});
